if status is-interactive
    # Commands to run in interactive sessions can go her

    set -x LANG zh_CN.UTF-8
    set -x LC_ALL zh_CN.UTF-8
    set -x LC_CTYPE zh_CN.UTF-8

    # 默认编辑器
    set -gx EDITOR nvim

    # 真彩色
    set -gx COLORTERM xterm-24color

    # 添加homebrew的环境路径
    set -gx PATH /opt/homebrew/bin $PATH

    # 添加pod的环境路径
    set -gx PATH /opt/homebrew/bin/pod $PATH

    # rust 环境变量
    set -gx PATH $HOME/.cargo/bin $PATH

    # 添加pkg-config的环境路径
    set -gx PKG_CONFIG_PATH /opt/homebrew/opt/ruby/lib/pkgconfig

    # 配置pnpm的环境路径 -- node包管理器
    set -gx PATH /opt/homebrew/opt/pnpm/bin $PATH
    set -gx PNPM_HOME "/Users/maobai/.local/share/pnpm"
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end

    # 配置fvm的环境路径 -- flutter版本管理器
    set -gx FVM_CACHE_PATH "$HOME/fvm"
    set -gx PATH $HOME/fvm/default/bin $PATH
    set -gx PATH $HOME/fvm/default/bin/cache/dart-sdk/bin $PATH
    set -gx PATH $HOME/.pub-cache/bin $PATH

    # 配置安卓环境
    set -gx ANDROID_HOME /Users/maobai/Library/Android/sdk
    set -gx PATH $ANDROID_HOME/platform-tools $PATH
    set -gx PATH $ANDROID_HOME/tools $PATH

    # 大模型 key
    set -gx BYTEDABCE_API_KEY feb8551e-d9c7-46d1-a8c6-7b7e500a94a5
    # ClaudeCode
    # set -gx ANTHROPIC_AUTH_TOKEN sk-zRoi94KKs6kUKAWgRJj6X16vmI6paqDZ1VA1He9n7KZBRXRN
    # set -gx ANTHROPIC_BASE_URL https://q.quuvv.cn

    # deepseek
    # set -gx ANTHROPIC_BASE_URL https://api.deepseek.com/anthropic
    # set -gx ANTHROPIC_AUTH_TOKEN sk-ea4a326aa4ea4d64a7a99b6edbfdaa05
    # set -gx ANTHROPIC_MODEL deepseek-chat
    # set -gx ANTHROPIC_SMALL_FAST_MODEL deepseek-chat

    # MinMax
    # set -gx ANTHROPIC_AUTH_TOKEN eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJHcm91cE5hbWUiOiJtYW9iYWkiLCJVc2VyTmFtZSI6Im1hb2JhaSIsIkFjY291bnQiOiIiLCJTdWJqZWN0SUQiOiIxOTg2NDQ4ODk4NTc4NzE1NDEzIiwiUGhvbmUiOiIxOTk4MjkzMzk5MSIsIkdyb3VwSUQiOiIxOTg2NDQ4ODk4NTc0NTIxMTA5IiwiUGFnZU5hbWUiOiIiLCJNYWlsIjoiIiwiQ3JlYXRlVGltZSI6IjIwMjUtMTEtMDcgMjI6MDU6MjgiLCJUb2tlblR5cGUiOjEsImlzcyI6Im1pbmltYXgifQ.Iq73PMo-WNtL_-pc_0MnEqF_Rz7eT5ExmPaCesVLzI_MP_2zqBFzNes5DR6M1O88d5XZYEgSlx7hD3md7mJyxaaOkNpzua-kazqurq1oLK9f_hGE2LAgz9syOu-3jTXlsXJbynEvZD6AcMUqL2TdaVqgELZMU2MPu0zOOh8YGje3wMi-b16u9rLoKKV_T0ZBVkRxbbfUMrfpqaOTyow4VK684q4ulw6MiPYtaaejwbRdOTV5upCjNcxM8-lnYn42xL0OxGBCYdbVZjahMCsQWhW8gB5T9Z2T2Jm7JMdXeTxqsM6F7M5CLuVvqe3X_PDmuKVQkNGNX8eHkoux8jbH1w
    # set -gx ANTHROPIC_BASE_URL https://api.minimaxi.com/anthropic

    # mise 包管理工具
    mise activate fish | source

    # 配置终端来初始化 starship -- shell美化工具
    starship init fish | source

    function yz
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # Added by OrbStack: command-line tools and integration
    # This won't be added again if you remove it.
    source ~/.orbstack/shell/init.fish 2>/dev/null || :

    # nvim 别名
    alias v="nvim"
    alias n="nvim"

    # zellij 别名
    alias zj="zellij"

    # lsd 别名
    alias ls="lsd"

    alias cwd="pwd | pbcopy"

    # pnpm 别名
    alias pi="pnpm run install"
    alias pd="pnpm run dev"
    alias pb="pnpm run build"
    alias ps="pnpm run start"
end
