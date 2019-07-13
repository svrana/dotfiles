_install() {
    mkdir -p ~/.emacs.d/{lisp,backups,themes}

    for i in ${RCS}/emacs.d/lisp/* ; do
        ln -sf "$i" ~/.emacs.d/lisp
    done

    if [ ! -d ~/.emacs.d/themes/emacs-color-theme-solarizsed ]; then
        git clone https://github.com/sellout/emacs-color-theme-solarized.git ~/.emacs.d/themes/emacs-color-theme-solarized
    fi
}
_install
