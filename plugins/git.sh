#!/bin/bash

source "$RC_DIR/git-completion.bash"
__git_complete gco _git_checkout
__git_complete g __git_main


alias gco='git checkout'
alias g='git'

function push_to_master() {
    local current_branch="$(git branch | grep ^* | cut -d' ' -f2)"
    local cmd="git push origin $current_branch:master"
    if ask Run \""$cmd"\"? ; then
        eval "${cmd}"
    else
        echo "push aborted"
    fi
}
