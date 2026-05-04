# Terminal / Block UI strings.
# Keys MUST start with `terminal-`.

terminal-filter-placeholder = Filter block output
terminal-context-lines-tooltip = Show context lines around matches
terminal-regex-tooltip = Regex toggle
terminal-case-sensitive-tooltip = Case sensitive search
terminal-invert-filter-tooltip = Invert filter
terminal-type-search-phrase = Type searched phrase.
terminal-press-escape = Press escape to quit
terminal-tag-agent = Tag agent for assistance
terminal-save-as-workflow = Save as Workflow
terminal-workflow-secrets-warning = Blocks containing secrets cannot be saved.
terminal-conversation-restored = Conversation restored
terminal-previous-session = Previous session
terminal-copy = Copy
terminal-cut = Cut
terminal-paste = Paste
terminal-select-all = Select all
terminal-share-block = Share block
terminal-copy-url = Copy URL
terminal-copy-path = Copy path
terminal-show-in-finder = Show in Finder
terminal-show-containing-folder = Show containing folder
terminal-open-in-warp = Open in Warp
terminal-open-in-editor = Open in editor
terminal-insert-into-input = Insert into input
terminal-copy-command = Copy command
terminal-copy-commands = Copy commands
terminal-copy-output = Copy output
terminal-copy-filtered-output = Copy filtered output
terminal-copy-prompt = Copy prompt
terminal-copy-right-prompt = Copy right prompt
terminal-copy-working-directory = Copy working directory
terminal-copy-git-branch = Copy git branch
terminal-copy-output-markdown = Copy output as Markdown
terminal-copy-conversation-text = Copy conversation text
terminal-save-as-prompt = Save as prompt
terminal-ask-warp-ai = Ask Warp AI
terminal-command-search = Command search
terminal-ai-command-search = AI command search
terminal-find-within-block = Find within block
terminal-find-within-blocks = Find within blocks
terminal-toggle-block-filter = Toggle block filter
terminal-toggle-bookmark = Toggle bookmark
terminal-scroll-top-block = Scroll to top of block
terminal-scroll-top-blocks = Scroll to top of blocks
terminal-scroll-bottom-block = Scroll to bottom of block
terminal-scroll-bottom-blocks = Scroll to bottom of blocks
terminal-share = Share...
terminal-share-block-menu = Share block...
terminal-fork-last-query = Fork from last query
terminal-fork-query = Fork from "{ $query }"
terminal-fork-from-here = Fork from here (dev only)
terminal-rewind-before-here = Rewind to before here
terminal-split-pane-right = Split pane right
terminal-split-pane-left = Split pane left
terminal-split-pane-down = Split pane down
terminal-split-pane-up = Split pane up
terminal-close-pane = Close pane
terminal-edit-cli-agent-toolbelt = Edit CLI agent toolbelt
terminal-edit-agent-toolbelt = Edit agent toolbelt
terminal-edit-prompt = Edit prompt
terminal-hide-input-hint = Hide input hint text
terminal-show-input-hint = Show input hint text
terminal-share-session = Share session...
terminal-stop-sharing = Stop sharing
terminal-copy-session-sharing-link = Copy session sharing link
terminal-copy-debugging-link = Copy debugging link
terminal-copy-conversation-id = Copy conversation ID
terminal-copy-debugging-id = Copy debugging ID
terminal-for-terminal = for terminal
terminal-loading-session = Loading session...

# Link tooltips (rich content + grid links)
terminal-link-open-folder = Open folder
terminal-link-open-file = Open file
terminal-link-open-link = Open link

# Zero state / SSH / shared session / init env / block onboarding
terminal-zero-new-session = New terminal session
terminal-zero-dont-show-again = Don't show again
terminal-ssh-dont-ask-again = Don't ask me this again
# SSH remote-server failed banner (per-failure-kind title + description)
terminal-ssh-failed-banner-title-binary-check = SSH extension couldn't be verified
terminal-ssh-failed-banner-title-binary-install = SSH extension couldn't be installed
terminal-ssh-failed-banner-title-launch = SSH extension couldn't be started
terminal-ssh-failed-banner-desc-binary-check = The SSH extension binary could not be verified on the remote host. While advanced features like file browsing and code review are currently disabled, the rest of your Warpified experience is fully available.
terminal-ssh-failed-banner-desc-binary-install = The binary could not be written or executed on the remote host. While advanced features like file browsing and code review are currently disabled, the rest of your Warpified experience is fully available.
terminal-ssh-failed-banner-desc-launch = The SSH extension could not be started on the remote host. While advanced features like file browsing and code review are currently disabled, the rest of your Warpified experience is fully available.
terminal-ssh-failed-banner-error-line = ERROR: {$detail}
terminal-shared-snapshot-title = You're viewing a snapshot
terminal-shared-snapshot-desc = This shared conversation shows the state when you opened it. If the agent is still running, refresh to see the latest progress.
terminal-init-env-mode-prompt = Choose how you'd like to set up your environment
terminal-init-env-suggested = Suggested
terminal-thinking = Thinking...

# Terminal input
terminal-no-results = No results
terminal-billed-to-api = Billed to API
terminal-or-separator = { " or " }

# Input suggestions mode placeholder texts (terminal/input.rs InputSuggestionsMode)
terminal-input-placeholder-search-queries = Search queries
terminal-input-placeholder-search-queries-rewind = Search queries to rewind to
terminal-input-placeholder-search-conversations = Search conversations
terminal-input-placeholder-search-skills = Search skills
terminal-input-placeholder-search-models = Search models
terminal-input-placeholder-search-profiles = Search profiles
terminal-input-placeholder-search-commands = Search commands
terminal-input-placeholder-search-prompts = Search prompts
terminal-input-placeholder-search-indexed-repos = Search indexed repos
terminal-input-placeholder-search-plans = Search plans
