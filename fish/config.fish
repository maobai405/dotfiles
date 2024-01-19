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


    # 配制mysql的环境路径
    set -gx PATH /opt/homebrew/opt/mysql@5.7/bin $PATH

    # 配置composer的环境路径 -- php包管理器
    set -gx PATH $HOME/.composer/vendor/bin $PATH

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

    # 添加fnm的环境路径 --node版本管理器
    fnm env --use-on-cd | source

    # 配置终端来初始化 starship -- shell美化工具
    starship init fish | source

    # yazi别名
    alias yz="yazi"

    # nvim 别名
    alias v="nvim"

    # zellij 别名
    alias zj="zellij"

end
