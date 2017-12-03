#!/bin/bash

function _update_ps1() {
    local priority='root,user,perms,virtualenv,git-branch,cwd'
    local modules='perms,user,venv,gitlite,ssh,cwd'
    PS1="$(powerline-go -theme solarized -modules ${modules} \
        -priority ${priority} -cwd-max-depth 3 -max-width 65)"
}

PROMPT_COMMAND="_update_ps1 ; $PROMPT_COMMAND"
