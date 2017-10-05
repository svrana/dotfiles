# pretty ls colors
[ -f ~/.dircolors ] && eval "$(dircolors ~/.dircolors)"

function __dotfiles_dircolors_install() {
    ln -sf "${DOTFILES_DIR}/misc/dircolors.ansi-dark" ~/.dircolors
}
