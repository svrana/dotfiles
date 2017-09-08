function _update_ps1() {
    PS1="$(powerline-go -theme solarized -modules "user,venv,ssh,cwd,perms")"
}

PROMPT_COMMAND="_update_ps1 ; $PROMPT_COMMAND"
