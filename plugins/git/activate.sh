source "$RC_DIR/git-completion.bash"
__git_complete gco _git_checkout
__git_complete g __git_main

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$current_dir/functions.sh"
