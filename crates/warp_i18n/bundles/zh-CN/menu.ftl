# 顶部菜单栏条目：应用 / 文件 / 编辑 / 视图 / 标签页 / 块 / AI / Drive / 窗口 / 帮助。
# Key 前缀 MUST 为 `menu-`，与 en bundle 保持一一对应。

# 顶部菜单名。
menu-app-warp = Warp
menu-app-file = 文件
menu-app-edit = 编辑
menu-app-view = 视图
menu-app-tab = 标签页
menu-app-blocks = 块
menu-app-ai = AI
menu-app-drive = Drive
menu-app-window = 窗口
menu-app-help = 帮助

# 应用（Warp）菜单。
menu-app-preferences = 偏好设置
menu-app-privacy-policy = 隐私政策…
menu-app-debug-submenu = 调试
menu-app-set-as-default-terminal = 将 Warp 设为默认终端
menu-app-log-out = 退出登录

# 文件菜单。
menu-file-new-window = 新建窗口
menu-file-new-terminal-tab = 新建终端标签页
menu-file-new-agent-tab = 新建 Agent 标签页
menu-file-reopen-closed-session = 重新打开已关闭会话
menu-file-launch-configurations = 启动配置
menu-file-launch-config-save-new = 另存为新配置…
menu-file-open-recent = 打开最近

# 编辑菜单。
menu-edit-use-warps-prompt = 使用 Warp 提示符
menu-edit-copy-on-select = 终端内选中即复制
menu-edit-synchronize-inputs = 同步输入

# 视图菜单。
menu-view-toggle-mouse-reporting = 切换鼠标上报
menu-view-toggle-scroll-reporting = 切换滚动上报
menu-view-toggle-focus-reporting = 切换焦点上报
menu-view-compact-mode = 紧凑模式

# 块菜单 —— 调试切换项，标签随状态翻转。
menu-blocks-debug-show-bootstrap = 显示初始化块
menu-blocks-debug-hide-bootstrap = 隐藏初始化块
menu-blocks-debug-show-in-band = 显示带内命令块
menu-blocks-debug-hide-in-band = 隐藏带内命令块
menu-blocks-debug-show-ssh = 显示 Warp 化的 SSH 块
menu-blocks-debug-hide-ssh = 隐藏 Warp 化的 SSH 块

# 调试子菜单。
menu-debug-shell-enable = 为新会话启用 Shell 调试模式（-x）
menu-debug-shell-disable = 为新会话禁用 Shell 调试模式（-x）
menu-debug-in-band-enable = 为新会话启用带内生成器
menu-debug-in-band-disable = 为新会话禁用带内生成器
menu-debug-pty-enable = 启用 PTY 录制模式（warp.pty.recording）
menu-debug-pty-disable = 禁用 PTY 录制模式（warp.pty.recording）
menu-debug-toggle-network-status = 手动切换网络状态
menu-debug-export-settings-csv = 将默认设置导出为 CSV 到主目录
menu-debug-create-anonymous-user = 创建匿名用户

# 帮助菜单。
menu-help-feedback = 发送反馈…
menu-help-documentation = Warp 文档…
menu-help-github-issues = GitHub Issues…
menu-help-slack-community = Warp Slack 社区…

# 上下文菜单 / 窗格操作。
menu-context-cut = 剪切
menu-context-copy = 复制
menu-context-paste = 粘贴
menu-context-split-pane-right = 向右拆分窗格
menu-context-split-pane-left = 向左拆分窗格
menu-context-split-pane-down = 向下拆分窗格
menu-context-split-pane-up = 向上拆分窗格
menu-context-minimize-pane = 最小化窗格
menu-context-maximize-pane = 最大化窗格
menu-context-close-pane = 关闭窗格

# 无障碍标签与说明。
menu-a11y-selected = { $item } 已选中
menu-a11y-expanded = { $item } 已展开
menu-a11y-submenu-expanded = 子菜单已展开
menu-a11y-submenu-closed = 子菜单已关闭
menu-a11y-menu-closed = 菜单已关闭
menu-a11y-action-selected = 操作已选中
menu-a11y-instructions-submenu-open = 按上方向键或下方向键选择菜单项。按右方向键打开子菜单
menu-a11y-instructions-submenu = 按上方向键或下方向键选择菜单项
menu-a11y-instructions-open = 按右方向键打开选中的子菜单
menu-a11y-instructions-close-submenu = 移除子菜单焦点将关闭子菜单
menu-a11y-instructions-close-menu = 按 Escape 键关闭菜单
menu-a11y-instructions-enter = 按 Enter 键执行选中的菜单项操作

# 右上角用户菜单
menu-user-whats-new = 新功能
menu-user-settings = 设置
menu-user-keyboard-shortcuts = 键盘快捷键
menu-user-documentation = 文档
menu-user-feedback = 反馈
menu-user-view-warp-logs = 查看 Warp 日志
menu-user-slack = Slack
menu-user-sign-up = 注册
menu-user-billing-and-usage = 账单与用量
menu-user-upgrade = 升级
menu-user-invite-a-friend = 邀请好友
menu-user-log-out = 退出登录

# 工作区菜单与标签页上下文菜单。
menu-workspace-search-repos = 搜索仓库
menu-workspace-search-tabs = 搜索标签页...
menu-workspace-rearrange-toolbar-items = 重新排列工具栏项目
menu-workspace-agent = 智能体
menu-workspace-terminal = 终端
menu-workspace-cloud-oz = 云端 Oz
menu-workspace-local-docker-sandbox = 本地 Docker 沙盒
menu-workspace-new-worktree-config = 新建工作树配置
menu-workspace-new-tab-config = 新建标签页配置
menu-workspace-current-version = 当前版本为 {$version}
menu-workspace-install-update = 安装更新（{$version}）
menu-workspace-updating-to = 正在更新到（{$version}）
menu-workspace-update-manually = 手动更新 Warp
menu-workspace-update-and-relaunch = 更新并重启 Warp
menu-workspace-add-new-repo = + 添加新仓库
menu-tab-stop-sharing = 停止共享
menu-tab-share-session = 共享会话
menu-tab-stop-sharing-all = 停止共享全部
menu-tab-copy-link = 复制链接
menu-tab-rename-tab = 重命名标签页
menu-tab-reset-tab-name = 重置标签页名称
menu-tab-rename-pane = 重命名窗格
menu-tab-reset-pane-name = 重置窗格名称
menu-tab-rename-active-pane = 重命名活动窗格
menu-tab-reset-active-pane-name = 重置活动窗格名称
menu-tab-move-down = 标签页下移
menu-tab-move-right = 标签页右移
menu-tab-move-up = 标签页上移
menu-tab-move-left = 标签页左移
menu-tab-close-tab = 关闭标签页
menu-tab-close-other-tabs = 关闭其他标签页
menu-tab-close-tabs-below = 关闭下方标签页
menu-tab-close-tabs-to-right = 关闭右侧标签页
menu-tab-save-as-new-config = 另存为新配置
