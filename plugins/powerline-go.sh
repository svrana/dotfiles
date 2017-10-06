function _update_ps1() {
    local priority='root,user,perms,virtualenv,git-branch,cwd'
    local modules='perms,user,venv,gitlite,ssh,cwd'
    PS1="$(powerline-go -theme solarized -modules ${modules} \
        -priority ${priority} -cwd-max-depth 3 -max-width 65)"
}

PROMPT_COMMAND="_update_ps1 ; $PROMPT_COMMAND"

function __dotfiles_powerline-go_install() {
    if [ ! -d "$GOPATH/src/github.com/svrana/powerline-go" ]; then
        go get -u github.com/svrana/powerline-go
        pushd $GOPATH/src/github.com/svrana/powerline-go
        go install
        popd
        ln -sf $GOPATH/src/github.com/svrana/powerline-go $HOME/Projects/powerline-go
    fi
}
