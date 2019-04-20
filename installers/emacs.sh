_install() {
    mkdir -p ~/.emacs.d/{lisp,backups,themes}

    for i in ${RCS}/emacs.d/lisp/* ; do
        ln -sf "$i" ~/.emacs.d/lisp
    done
}
_install
