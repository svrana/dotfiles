#!/bin/bash

#
# ff dogbutt
# 	Find a file with case insensitive pattern in name, removing fluff.
ff() {
    find . -iname '*'$1'*' -printf "%P\n" 2>/dev/null
}

# ff dogbutt rm
# 	Find a file with case insensitive pattern $1 in name and execute $2 on it.
fe() {
    find . -type f -iname '*'"$1"'*' -exec "${2:-file}" {} \;
}

# ff client
# 	Find any type of file, removing fluff.
fa() {
    find . -iname '*'"$1"'*' -printf "%P\n" 2>/dev/null
}
