#!/bin/bash

function _update_ps1() {
    local priority='root,user,perms,virtualenv,vgo,git-branch,cwd'
    local modules='perms,user,venv,vgo,gitlite,ssh,cwd'
    PS1="$(powerline-go -theme default -modules ${modules} \
        -priority ${priority} -cwd-max-depth 3 -max-width 65 \
        -path-aliases \~/go/src/github.com=@go-gh
        )"
}

PROMPT_COMMAND="_update_ps1 ; $PROMPT_COMMAND"
