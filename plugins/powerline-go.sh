#!/bin/bash

function _update_ps1() {
    local priority='root,perms,venv,git-branch,exit,cwd'
    local modules='perms,venv,gitlite,ssh,cwd,exit'
    PS1="$(powerline-go -theme default -modules ${modules} \
        -priority ${priority} -cwd-max-depth 1 -max-width 65 \
        -path-aliases \~/go/src/github.com=@go-gh
        )"
}

PROMPT_COMMAND="_update_ps1 ; $PROMPT_COMMAND"
