#!/bin/bash

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMAMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--bind=ctrl-f:page-down,ctrl-b:page-up,ctrl-d:page-up'

[ -f "$RCS/fzf.bash" ] && . "$RCS/fzf.bash"

if [ ! -z "$PS1" ]; then
    # bind error during install cause no terminal
    bind -x '"\C-p": f() { local file=$(fzf -m --height 80% --reverse) && [[ -n $file ]] && nvim $file ; }; f'
    bind -x '"\C-n": f() { pushd $DOTFILES > /dev/null ; local file=$(fzf -m --height 80% --reverse) && [[ -n $file ]] && nvim $file ; popd > /dev/null ; }; f'
fi

fzf-down() {
    fzf --height 50% "$@" --border
}
