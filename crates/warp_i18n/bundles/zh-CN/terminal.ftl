# 终端 / 区块界面字符串。
# Keys MUST start with `terminal-`.

terminal-filter-placeholder = 搜索区块输出
terminal-context-lines-tooltip = 显示匹配项的上下文行
terminal-regex-tooltip = 正则表达式切换
terminal-case-sensitive-tooltip = 区分大小写搜索
terminal-invert-filter-tooltip = 反向筛选
terminal-type-search-phrase = 输入搜索内容。
terminal-press-escape = 按 Escape 退出
terminal-tag-agent = 标记智能体以获取帮助
terminal-save-as-workflow = 保存为工作流
terminal-workflow-secrets-warning = 包含密钥的区块无法保存。
terminal-conversation-restored = 对话已恢复
terminal-previous-session = 上一会话
terminal-copy = 复制
terminal-cut = 剪切
terminal-paste = 粘贴
terminal-select-all = 全选
terminal-share-block = 分享区块
terminal-copy-url = 复制 URL
terminal-copy-path = 复制路径
terminal-show-in-finder = 在 Finder 中显示
terminal-show-containing-folder = 显示所在文件夹
terminal-open-in-warp = 在 Warp 中打开
terminal-open-in-editor = 在编辑器中打开
terminal-insert-into-input = 插入到输入框
terminal-copy-command = 复制命令
terminal-copy-commands = 复制命令
terminal-copy-output = 复制输出
terminal-copy-filtered-output = 复制筛选后的输出
terminal-copy-prompt = 复制提示符
terminal-copy-right-prompt = 复制右侧提示符
terminal-copy-working-directory = 复制工作目录
terminal-copy-git-branch = 复制 Git 分支
terminal-copy-output-markdown = 以 Markdown 复制输出
terminal-copy-conversation-text = 复制会话文本
terminal-save-as-prompt = 保存为提示词
terminal-ask-warp-ai = 询问 Warp AI
terminal-command-search = 命令搜索
terminal-ai-command-search = AI 命令搜索
terminal-find-within-block = 在区块内查找
terminal-find-within-blocks = 在区块内查找
terminal-toggle-block-filter = 切换区块筛选
terminal-toggle-bookmark = 切换书签
terminal-scroll-top-block = 滚动到区块顶部
terminal-scroll-top-blocks = 滚动到区块顶部
terminal-scroll-bottom-block = 滚动到区块底部
terminal-scroll-bottom-blocks = 滚动到区块底部
terminal-share = 分享...
terminal-share-block-menu = 分享区块...
terminal-fork-last-query = 从上一条提问 fork
terminal-fork-query = 从“{ $query }”fork
terminal-fork-from-here = 从这里 fork（仅开发）
terminal-rewind-before-here = 回退到这里之前
terminal-split-pane-right = 向右拆分窗格
terminal-split-pane-left = 向左拆分窗格
terminal-split-pane-down = 向下拆分窗格
terminal-split-pane-up = 向上拆分窗格
terminal-close-pane = 关闭窗格
terminal-edit-cli-agent-toolbelt = 编辑 CLI 智能体工具栏
terminal-edit-agent-toolbelt = 编辑智能体工具栏
terminal-edit-prompt = 编辑提示符
terminal-hide-input-hint = 隐藏输入提示文本
terminal-show-input-hint = 显示输入提示文本
terminal-share-session = 分享会话...
terminal-stop-sharing = 停止分享
terminal-copy-session-sharing-link = 复制会话分享链接
terminal-copy-debugging-link = 复制调试链接
terminal-copy-conversation-id = 复制会话 ID
terminal-copy-debugging-id = 复制调试 ID
terminal-for-terminal = 返回终端
terminal-loading-session = 正在加载会话...

# 链接提示气泡（富内容 + 网格链接）
terminal-link-open-folder = 打开文件夹
terminal-link-open-file = 打开文件
terminal-link-open-link = 打开链接

# 零态 / SSH / 共享会话 / 初始化环境 / 区块引导
terminal-zero-new-session = 新建终端会话
terminal-zero-dont-show-again = 不再显示
terminal-ssh-dont-ask-again = 不再询问
# SSH 远程服务端启动失败横幅（按失败种类提供标题与描述）
terminal-ssh-failed-banner-title-binary-check = SSH 扩展无法验证
terminal-ssh-failed-banner-title-binary-install = SSH 扩展无法安装
terminal-ssh-failed-banner-title-launch = SSH 扩展无法启动
terminal-ssh-failed-banner-desc-binary-check = 无法在远程主机上验证 SSH 扩展二进制文件。虽然文件浏览、代码审查等高级功能暂不可用，但 Warpify 体验的其他部分仍完全可用。
terminal-ssh-failed-banner-desc-binary-install = 二进制文件无法写入或在远程主机上执行。虽然文件浏览、代码审查等高级功能暂不可用，但 Warpify 体验的其他部分仍完全可用。
terminal-ssh-failed-banner-desc-launch = 无法在远程主机上启动 SSH 扩展。虽然文件浏览、代码审查等高级功能暂不可用，但 Warpify 体验的其他部分仍完全可用。
terminal-ssh-failed-banner-error-line = 错误：{$detail}
terminal-shared-snapshot-title = 你正在查看快照
terminal-shared-snapshot-desc = 此共享会话显示打开时的状态。若智能体仍在运行，请刷新以查看最新进度。
terminal-init-env-mode-prompt = 选择你希望如何设置环境
terminal-init-env-suggested = 建议
terminal-thinking = 思考中...

# 终端输入
terminal-no-results = 无结果
terminal-billed-to-api = 按 API 计费
terminal-or-separator = { " 或 " }

# 输入建议模式 placeholder 文案（terminal/input.rs InputSuggestionsMode）
terminal-input-placeholder-search-queries = 搜索查询
terminal-input-placeholder-search-queries-rewind = 搜索可回退到的查询
terminal-input-placeholder-search-conversations = 搜索会话
terminal-input-placeholder-search-skills = 搜索技能
terminal-input-placeholder-search-models = 搜索模型
terminal-input-placeholder-search-profiles = 搜索配置文件
terminal-input-placeholder-search-commands = 搜索命令
terminal-input-placeholder-search-prompts = 搜索提示词
terminal-input-placeholder-search-indexed-repos = 搜索已索引仓库
terminal-input-placeholder-search-plans = 搜索计划
