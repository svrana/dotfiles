mkdir -p ~/.config/fontconfig/conf.d
mkdir -p ~/.config/powerline/themes/{shell,tmux}
mkdir -p ~/.local/share/fonts

if [ ! -d "$APPS/fonts" ]; then
    git clone https://github.com/powerline/fonts.git "$APPS/fonts"
    "$APPS/fonts/install.sh"
fi

ln -sf "${RC_DIR}/powerline-shell.json" ~/.config/powerline/themes/shell/default.json
ln -sf "${RC_DIR}/powerline-tmux.json" ~/.config/powerline/themes/tmux/default.json
ln -sf "${DOTFILES}/misc/PowerlineSymbols.otf" ~/.local/share/fonts/PowerlineSymbols.otf
ln -sf "${DOTFILES}/misc/50-enable-terminess-powerline.conf" ~/.config/fontconfig/conf.d/

function _prep_fonts() {
    fc-cache -vf ~/.local/share/fonts > /dev/null 2>&1
    estatus "Built font cache for powerline"
}
_prep_fonts

function _powerline_install() {
    if [ ! -f ~/.local/bin/powerline ]; then
        pip install --user powerline-status
        estatus "Installed powerline-status via pip --user"
    fi
}
return $(_powerline_install)
