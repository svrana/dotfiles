#!/bin/bash

mkdir -p ~/.config/fontconfig/conf.d
mkdir -p ~/.config/powerline/themes/{shell,tmux}
mkdir -p ~/.local/share/fonts

if [ ! -d "$APPS/fonts" ]; then
    git clone --depth 1 https://github.com/powerline/fonts.git "$APPS/fonts"
    "$APPS/fonts/install.sh"
fi

ln -sf "${RCS}/powerline-shell.json" ~/.config/powerline/themes/shell/default.json
ln -sf "${RCS}/powerline-tmux.json" ~/.config/powerline/themes/tmux/default.json
ln -sf "${DOTFILES}/misc/PowerlineSymbols.otf" ~/.local/share/fonts/PowerlineSymbols.otf
ln -sf "${DOTFILES}/misc/50-enable-terminess-powerline.conf" ~/.config/fontconfig/conf.d/

if [ ! -f ~/.local/bin/powerline ]; then
    pip install --user powerline-status
    estatus "Installed powerline-status via pip --user"
fi
