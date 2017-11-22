#!/bin/bash

export FZF_DEFAULT_COMMAND='ag -l -g ""'    # ag for showing only interesting files
export FZF_CTRL_T_COMAMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--bind=ctrl-f:page-down,ctrl-b:page-up,ctrl-d:page-up'

[ -f "$RC_DIR/fzf.bash" ] && . "$RC_DIR/fzf.bash"

bind -x '"\C-p": f() { local file=$(fzf -m --height 80% --reverse) && [[ -n $file ]] && nvim $file ; }; f'

function __dotfiles_fzf_install() {
    if [ ! -d "$APPS/fzf" ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git "$APPS/fzf"
        "$APPS/fzf/install" --bin
        ln -sf "$APPS/fzf/bin/fzf" "${BIN_DIR}/fzf"
        ln -sf "$APPS/fzf/bin/fzf-tmux" "${BIN_DIR}/fzf-tmux"
    fi
}
