//! Compile-time validation for the embedded Fluent bundles.
//!
//! Responsibilities:
//! - Parse every `bundles/<locale>/*.ftl` and abort the build on syntax errors.
//! - Emit `OUT_DIR/key_index.rs` containing a `phf::Set<&'static str>` of keys defined
//!   in `bundles/en/`. Downstream code may `include!` it for runtime sanity checks.
//! - Re-run when bundle contents change.

use std::collections::BTreeSet;
use std::env;
use std::fs;
use std::io::Write;
use std::path::{Path, PathBuf};

fn main() {
    let manifest_dir = PathBuf::from(env::var_os("CARGO_MANIFEST_DIR").unwrap());
    let bundles_dir = manifest_dir.join("bundles");
    println!("cargo:rerun-if-changed={}", bundles_dir.display());

    let mut en_keys: BTreeSet<String> = BTreeSet::new();
    let mut errors: Vec<String> = Vec::new();

    for entry in walkdir::WalkDir::new(&bundles_dir).into_iter().flatten() {
        if !entry.file_type().is_file() {
            continue;
        }
        if entry.path().extension().and_then(|s| s.to_str()) != Some("ftl") {
            continue;
        }
        println!("cargo:rerun-if-changed={}", entry.path().display());
        let source = match fs::read_to_string(entry.path()) {
            Ok(s) => s,
            Err(e) => {
                errors.push(format!("read {}: {e}", entry.path().display()));
                continue;
            }
        };
        match fluent_syntax::parser::parse(source.as_str()) {
            Ok(resource) => {
                if is_en(entry.path(), &bundles_dir) {
                    for entry in resource.body {
                        if let fluent_syntax::ast::Entry::Message(msg) = entry {
                            en_keys.insert(msg.id.name.to_string());
                        }
                    }
                }
            }
            Err((_, parse_errors)) => {
                for err in parse_errors {
                    errors.push(format!("{}: {err:?}", entry.path().display()));
                }
            }
        }
    }

    if !errors.is_empty() {
        for e in &errors {
            eprintln!("warp_i18n: ftl error: {e}");
        }
        panic!("warp_i18n: {} ftl parse error(s); aborting build", errors.len());
    }

    let out_dir = PathBuf::from(env::var_os("OUT_DIR").unwrap());
    let dest = out_dir.join("key_index.rs");
    let mut file = fs::File::create(&dest).expect("create key_index.rs");
    let mut builder = phf_codegen::Set::new();
    for k in &en_keys {
        builder.entry(k.as_str());
    }
    writeln!(
        file,
        "pub static EN_KEY_INDEX: phf::Set<&'static str> = {};",
        builder.build()
    )
    .expect("write key_index.rs");
    writeln!(file, "pub const EN_KEY_COUNT: usize = {};", en_keys.len()).unwrap();

    // Emit a static array of (locale, filename, content) for every
    // `bundles/<locale>/*.ftl` using `include_str!`. Replaces the previous
    // rust-embed-based loader, which on CI silently shipped only the `en/`
    // subtree — `zh-CN/` files never made it into the binary, so
    // `Bundles::load` bailed with "no .ftl files found", `warp_i18n::init`
    // returned Err, and every `t!()` rendered as `{key}` (lib.rs:107-110).
    // `include_str!` has no runtime path concept and no feature-flag chain
    // to misconfigure.
    let dest = out_dir.join("embedded_bundles.rs");
    let mut file = fs::File::create(&dest).expect("create embedded_bundles.rs");
    writeln!(
        file,
        "pub static EMBEDDED_BUNDLES: &[(&str, &str, &str)] = &["
    )
    .unwrap();
    let mut entries: Vec<(String, String, PathBuf)> = Vec::new();
    for entry in walkdir::WalkDir::new(&bundles_dir).into_iter().flatten() {
        if !entry.file_type().is_file() {
            continue;
        }
        if entry.path().extension().and_then(|s| s.to_str()) != Some("ftl") {
            continue;
        }
        let rel = match entry.path().strip_prefix(&bundles_dir) {
            Ok(p) => p,
            Err(_) => continue,
        };
        let locale = match rel.components().next() {
            Some(c) => c.as_os_str().to_string_lossy().into_owned(),
            None => continue,
        };
        let filename = entry
            .path()
            .file_name()
            .and_then(|s| s.to_str())
            .unwrap_or("")
            .to_owned();
        if filename.is_empty() {
            continue;
        }
        entries.push((locale, filename, entry.path().to_path_buf()));
    }
    // Sort so build output is deterministic across runs.
    entries.sort_by(|a, b| (a.0.as_str(), a.1.as_str()).cmp(&(b.0.as_str(), b.1.as_str())));
    for (locale, filename, abs_path) in &entries {
        writeln!(
            file,
            "    ({:?}, {:?}, include_str!({:?})),",
            locale, filename, abs_path
        )
        .unwrap();
    }
    writeln!(file, "];").unwrap();
}

fn is_en(path: &Path, bundles_dir: &Path) -> bool {
    path.strip_prefix(bundles_dir)
        .ok()
        .and_then(|p| p.components().next())
        .map(|c| c.as_os_str() == "en")
        .unwrap_or(false)
}
