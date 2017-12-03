#!/bin/bash

source "$RCS/git-completion.bash"
__git_complete gco _git_checkout
__git_complete g __git_main


alias gco='git checkout'
alias g='git'

# return non-zero status if the current directory is not managed by git
function is_in_git_repo() {
    git rev-parse HEAD > /dev/null 2>&1
}

function git-push-to-master() {
    local current_branch="$(git branch | grep ^* | cut -d' ' -f2)"
    local cmd="git push origin $current_branch:master"
    if ask Run \""$cmd"\"? ; then
        eval "${cmd}"
    else
        echo "push aborted"
    fi
}
