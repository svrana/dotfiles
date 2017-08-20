alias tma='tmux attach -d -t'
alias tmux='deactivate 2>/dev/null 1>&2 ; direnv exec / tmux'

# create named tmux session, i.e., tmux new -s dev
function tmn() {
    if [ -z "$1" ]; then
        tmux
    else
        tmux new-session -s "$1"
    fi
}

