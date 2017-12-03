#!/bin/bash

if [ ! -d "$APPS/fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git "$APPS/fzf"
    "$APPS/fzf/install" --bin
    ln -sf "$APPS/fzf/bin/fzf" "${BIN_DIR}/fzf"
    ln -sf "$APPS/fzf/bin/fzf-tmux" "${BIN_DIR}/fzf-tmux"
fi
