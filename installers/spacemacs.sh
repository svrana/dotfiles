install() {
    if [ ! -d ~/.emacs.d ]; then
        git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
    fi
}
install
