if status is-interactive
    # Commands to run in interactive sessions can go her

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

    # 配置fvm的环境路径 -- flutter版本管理器
    set -gx FVM_HOME "$HOME/fvm"
    set -gx PATH $HOME/fvm/default/bin $PATH
    set -gx PATH $HOME/fvm/default/bin/cache/dart-sdk/bin $PATH
    set -gx PATH $HOME/.pub-cache/bin $PATH

    # 大模型 key
    set -gx ANTHROPIC_API_KEY sk-HDilxHT3viL4T5mC4690107cAa794015Aa86Ee321b9830E1
    set -gx OPENAI_API_KEY sk-HDilxHT3viL4T5mC4690107cAa794015Aa86Ee321b9830E1
    set -gx LLM_KEY sk-HDilxHT3viL4T5mC4690107cAa794015Aa86Ee321b9830E1
    set -gx DEEPSEEK_API_KEY feb8551e-d9c7-46d1-a8c6-7b7e500a94a5

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

    # nvim 别名
    alias v="nvim"

    alias n="neovide"

    # zellij 别名
    alias zj="zellij"

    # lsd 别名
    alias ls="lsd"

    # pnpm 别名
    alias pi="pnpm run install"
    alias pd="pnpm run dev"
    alias ps="pnpm run start"
end

# pnpm
set -gx PNPM_HOME "/Users/maobai/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
