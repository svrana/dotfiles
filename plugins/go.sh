#!/bin/bash

export GOPATH="$HOME/go"
export GOROOT=/usr/local/go
PATH_append "$GOPATH/bin:$GOROOT/bin"

[ ! -d "$GOPATH" ] && mkdir "$GOPATH"

alias gopath='echo -e ${GOPATH//:/\\n}'

function cdg() {
    [ -z "$1" ] && echo "Must specify a project" && return
    local project="$1"
    local project_root="${project%%/*}"
    local dir

    dir="$(fd --max-depth 3 "$project_root" "$HOME/go/src")"
    if [ -n "$dir" ]; then
        local subdirs="${project#$project_root/*}"
        if [ "$project" != "$project_root" ]; then
            cd "$dir" && cd "$subdirs"
        else
            cd "$dir"
        fi
    fi
}
