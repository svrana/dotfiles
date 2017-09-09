function _update_ps1() {
    PS1="$(powerline-go -theme solarized -modules "perms,user,venv,ssh,cwd" -cwd-max-depth 3)"
}

PROMPT_COMMAND="_update_ps1 ; $PROMPT_COMMAND"
