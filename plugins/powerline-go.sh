function _update_ps1() {
    PS1="$(powerline-go -theme solarized -modules "perms,user,venv,ssh,cwd")"
}

PROMPT_COMMAND="_update_ps1 ; $PROMPT_COMMAND"
