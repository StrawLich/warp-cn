# CLAUDE.md — StrawLich/warp-cn 自用维护指南

本仓库是 [Heartcoolman/warp-cn](https://github.com/Heartcoolman/warp-cn) 的 fork，
用于在 Deepin 25 (Linux x86_64) 上构建和自用 Warp 中文社区版终端。
包含上游的完整汉化和国产模型路由（Direct LLM Backend）支持，
以及本 fork 维护的 Linux 特有修复。

## 关键信息

- **系统环境:** Deepin 25, x86_64, Rust 1.96.0
- **Rust 工具链:** 本地 `rust-toolchain.toml` 已改为 1.96.0（上游用 1.92.0），**不要提交此文件**
- **GitHub 用户名:** StrawLich
- **Remote 配置:**
  - `origin` → `https://github.com/StrawLich/warp-cn.git`（本 fork）
  - `upstream` → `https://github.com/Heartcoolman/warp-cn.git`（上游）

## 构建命令

### 系统依赖（Debian/Ubuntu）

```bash
sudo apt-get install -y build-essential cmake pkg-config curl git \
  libssl-dev libfreetype-dev libexpat1-dev libgit2-dev \
  libfontconfig1-dev libasound2-dev libclang-dev clang-format \
  jq brotli python-is-python3
```

还需安装 protoc v25.1（Ubuntu apt 版本过旧）：
```bash
# 从 GitHub 下载 protoc-25.1-linux-x86_64.zip，解压到 /usr/local
```

### 编译 OSS 版本

```bash
source ~/.cargo/env
cargo build -p warp --profile release-lto --bin warp-oss \
  --features "release_bundle,gui,nld_classifier_v1,nld_heuristic_v1"
```

- 产物：`target/release-lto/warp-oss`
- 编译时间：~15-30 分钟（首次），增量 ~10-15 分钟
- `release-lto` profile 使用 Thin LTO，编译较慢但产物更小更快

### 打包 .deb

推荐使用仓库自带脚本：
```bash
./script/linux/bundle -c oss --packages deb --release-tag v0.YYYY.MM.DD
```

或手动打包（简易方式）：
```bash
dpkg-deb -b /tmp/warp-deb-staging /path/to/warp-terminal-oss_VERSION_amd64.deb
```

### 安装

```bash
sudo dpkg -i warp-terminal-oss_VERSION_amd64.deb
```

二进制安装位置：`/opt/warpdotdev/warp-terminal-oss/warp-oss`
命令行入口：`/usr/bin/warp-terminal-oss` 或 `/usr/bin/warp-terminal`

## 本 Fork 的独有修复

### 1. i18n 初始化崩溃修复

**文件:** `crates/warp_i18n/bundles/en/settings_billing.ftl`, `crates/warp_i18n/bundles/zh-CN/settings_billing.ftl`

上游在 `settings_billing.ftl` 中有重复的 key `settings-billing-no-usage-history`（第 5 行和第 131 行）。
FluentBundle 不允许重复 key，导致 `add_resource()` 返回 `Overriding` 错误，
i18n 初始化静默失败（`warp_i18n::init()` 在 tracing 初始化之前调用，错误被吞掉），
所有 `t!()` 调用返回 `{key}` 占位符。

**修复:** 删除第 5 行的重复条目，保留第 131 行。

### 2. Linux IME 输入法支持

**文件:** `crates/warp_features/src/lib.rs`, `crates/warpui/src/windowing/winit/window.rs`

上游的 IME（输入法）代码只对 macOS 和 Windows 启用，Linux 上：
- `ImeMarkedText` 功能标记被 `#[cfg(target_os = "macos")]` 限制在 macOS
- `set_ime_allowed(true)` 只在 `#[cfg(windows)]` 块中调用

导致 Linux 上 fcitx/ibus 等输入法无法激活，无法输入中文。

**修复:**
1. `warp_features/src/lib.rs`: 将 `#[cfg(target_os = "macos")]` 改为 `#[cfg(any(target_os = "macos", target_os = "linux"))]`
2. `window.rs`: 在 `#[cfg(windows)]` 块后添加 `#[cfg(target_os = "linux")]` 块调用 `set_ime_allowed(true)`

## 从上游同步更新

上游每周一自动同步 warpdotdev/warp，当 Heartcoolman/warp-cn 有新版本时：

```bash
# 1. 拉取上游更新
git fetch upstream

# 2. 合并到本地 master
git checkout master
git merge upstream/master

# 3. 检查冲突 — 特别关注：
#    - crates/warp_i18n/bundles/ 下的 FTL 文件（重复 key 可能重现）
#    - crates/warp_features/src/lib.rs（功能标记配置）
#    - crates/warpui/src/windowing/winit/window.rs（IME 代码）
#    - rust-toolchain.toml（版本号差异，保持本地修改不提交）

# 4. 如果上游修复了重复 key 问题，可以移除本 fork 的对应修复
#    运行 i18n 测试验证：cargo test -p warp_i18n

# 5. 推送到本 fork
git push origin master

# 6. 重新构建并安装
cargo build -p warp --profile release-lto --bin warp-oss \
  --features "release_bundle,gui,nld_classifier_v1,nld_heuristic_v1"
# 然后打包 .deb 并安装
```

### 同步后必做检查

1. **i18n 测试:** `cargo test -p warp_i18n` — 确保没有新的重复 key
2. **i18n parity:** `cargo xtask check-i18n --check-parity` — 确保 en/zh-CN 对齐
3. **IME 代码冲突:** 检查 `window.rs` 的 `set_ime_allowed` 和 `lib.rs` 的 `ImeMarkedText` 是否被上游改动覆盖
4. **构建验证:** 完整编译确保无错误

## 项目结构速览

| 目录 | 用途 |
|------|------|
| `app/` | 主应用（UI、AI 助手、设置、认证） |
| `app/src/bin/oss.rs` | OSS 通道入口 |
| `crates/warp_i18n/` | 国际化（Fluent FTL，t!() 宏） |
| `crates/warp_features/` | 功能标记定义 |
| `crates/warpui/` | GPU 加速 UI 渲染框架 |
| `crates/ai/src/direct_backend/` | Direct LLM Backend（国产模型路由） |
| `crates/warp_core/` | 核心应用状态、终端会话 |
| `crates/warp_terminal/` | 终端仿真引擎 |
| `script/` | 构建、打包、引导脚本 |
| `resources/linux/` | Linux 打包模板 |

## Direct LLM Backend 配置

本 fork 的核心功能之一，允许直连 LLM 提供商绕过 Warp 云服务。

- **Cargo feature:** `direct_llm_backend`（隐含 `skip_login`）
- **Runtime feature flag:** `FeatureFlag::DirectLlmBackend`（已在 RELEASE_FLAGS 中启用）
- **支持的提供商:** OpenAI、Anthropic、Google Gemini、OpenAI Compatible（DeepSeek、Qwen、GLM、SiliconFlow 等）
- **配置位置:** Warp 设置 → AI → Direct Backend
- **API Key 存储:** 使用系统安全存储（Linux: Secret Service / libsecret + AES-256-GCM 文件回退）

## 提交规范

- **不要提交 `rust-toolchain.toml`** — 本地改动（1.96.0），上游用 1.92.0
- **FTL 文件修改后** 必须运行 `cargo test -p warp_i18n` 验证
- **功能标记修改** 在 `crates/warp_features/src/lib.rs`，注意平台 cfg 守卫
- **Commit 风格:** `type(scope): description`（如 `fix(i18n):`, `feat(linux):`）
