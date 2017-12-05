#!/bin/bash

alias cd..='cd ..'
alias ..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

function cdp() {
    local project="$1"

    if [ -z "$project" ]; then
        if [ -n "$GRUF_PROJECT" ]; then
            cd "$GRUF_PROJECT"
        else
            echo "Must specify directory or project name"
        fi
        return
    fi

    local project_root="${project%%/*}"
    local dir
    dir="$(fd --max-depth 2 "$project_root" "$PROJECTS")"

    if [ -n "$dir" ]; then
        local subdirs="${project#$project_root/*}"
        if [ "$project" != "$project_root" ]; then
            cd "$dir" && cd "$subdirs"
        else
            cd "$dir"
        fi
    else
        # maybe it's a go project
        cdg "$project"
    fi

}
