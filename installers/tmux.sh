#!/bin/bash

ln -sf "${RCS}/tmux.conf" ~/.tmux.conf

mkdir -p ~/.tmux/plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo
~/.tmux/plugins/tpm/bin/install_plugins
~/.tmux/plugins/tpm/bin/clean_plugins
