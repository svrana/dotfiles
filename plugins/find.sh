#!/bin/bash

#
# ff dogbutt
# 	Find a file with case insensitive pattern in name, removing fluff.
function ff() {
    find . -iname '*'$1'*' -printf "%P\n" 2>/dev/null
}

# ff dogbutt rm
# 	Find a file with case insensitive pattern $1 in name and execute $2 on it.
function fe() {
    find . -type f -iname '*'"$1"'*' -exec "${2:-file}" {} \;
}

# ff client
# 	Find any type of file, removing fluff.
function fa() {
    find . -iname '*'"$1"'*' -printf "%P\n" 2>/dev/null
}


# kill vim swap files
alias kvswap='rm  ~/.local/share/nvim/swap/*'
