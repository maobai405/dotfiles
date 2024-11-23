if status is-interactive
    # Commands to run in interactive sessions can go her

    # 添加homebrew的环境路径
    set -gx PATH /opt/homebrew/bin $PATH

    # 添加pod的环境路径
    set -gx PATH /opt/homebrew/bin/pod $PATH

    # rust 环境变量
    set -x PATH $HOME/.cargo/bin $PATH

    # 添加pkg-config的环境路径
    set -gx PKG_CONFIG_PATH /opt/homebrew/opt/ruby/lib/pkgconfig


    # 配置pnpm的环境路径 -- node包管理器
    set -gx PATH /opt/homebrew/opt/pnpm/bin $PATH
    set -gx PNPM_HOME /Users/maobai/Library/pnpm
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end

    # 配置fvm的环境路径 -- flutter版本管理器
    set -gx FVM_HOME "$HOME/fvm"
    set -gx PATH $HOME/fvm/default/bin $PATH
    set -gx PATH $HOME/fvm/default/bin/cache/dart-sdk/bin $PATH
    set -gx PATH $HOME/.pub-cache/bin $PATH

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

    # zellij 别名
    alias zj="zellij"

    # lsd 别名
    alias ls="lsd"
end
