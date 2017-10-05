export DIRENV_LOG_FORMAT=
eval "$(direnv hook bash)"

function __dotfiles_direnv_install() {
    ln -sf "${RC_DIR}/direnvrc"  ~/.config/direnv/direnvrc

    if [ ! -d "$GOPATH/src/github.com/direnv" ]; then
        go get -u github.com/direnv/direnv
        cd "$GOPATH/src/github.com/direnv/direnv"
        make && sudo make install
    fi
}
