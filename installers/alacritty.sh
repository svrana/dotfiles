#!/bin/bash

mkdir -p ~/.config/alacritty

ln -sf "${RCS}/alacritty.yml" ~/.config/alacritty/alacritty.yml
ln -sf "${DOTFILES}/misc/alacritty.desktop" ~/.local/share/applications
