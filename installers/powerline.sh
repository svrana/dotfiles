#!/bin/bash

mkdir -p ~/.config/fontconfig/conf.d
mkdir -p ~/.config/powerline/themes/{shell,tmux}
mkdir -p ~/.local/share/fonts

ln -sf "${RCS}/powerline-shell.json" ~/.config/powerline/themes/shell/default.json
ln -sf "${RCS}/powerline-tmux.json" ~/.config/powerline/themes/tmux/default.json
ln -sf "${DOTFILES}/misc/50-enable-terminess-powerline.conf" ~/.config/fontconfig/conf.d/

if [ ! -f ~/.local/bin/powerline ]; then
    pip install --user powerline-status
    estatus "Installed powerline-status via pip --user"
fi
