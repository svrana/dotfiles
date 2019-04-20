#!/bin/bash

mkdir -p ~/.config/nvim/{bak,swp}
mkdir -p ~/.config/nvim/after/ftplugin
mkdir -p ~/.config/nvim/bundle
mkdir -p ~/.config/nvim/autoload


function _link_ftplugins() {
    local i
    for i in ${RCS}/nvim/ftplugin/* ; do
        i=$(basename "$i")
        ln -sf "${RCS}/nvim/ftplugin/$i" ~/.config/nvim/after/ftplugin/"$i"
    done
}
_link_ftplugins

PLUG_DIR="$HOME/.local/share/nvim/site/autoload"
if [ ! -f "$PLUG_DIR/plug.vim" ]; then
    curl -fLo "$PLUG_DIR/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    estatus "Cloned Plug"
fi

if [ ! -f ~/.config/nvim/init.vim ]; then
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
fi

ln -sf "${RCS}/nvim/vimrc" ~/.config/nvim/init.vim

function _go_config() {
    if [ -n "$GOPATH" -a ! -d "$GOPATH/src/github.com/nsf/gocode" ]; then
        go get -u github.com/nsf/gocode
        "$GOPATH/src/github.com/nsf/gocode/nvim/symlink.sh" > /dev/null 2>&1
    fi
}
_go_config

WORKON_HOME=${WORKON_HOME-~/.virtualenvs/}
if [ ! -d ~/.virtualenvs/neovim3 ]; then
    virtualenv -p /usr/bin/python3 "$WORKON_HOME/neovim3"
    "$WORKON_HOME/neovim3/bin/pip3" install neovim
    "$WORKON_HOME/neovim3/bin/pip3" install jedi
fi

if [ ! -d ~/.virtualenvs/neovim2 ]; then
    virtualenv -p /usr/bin/python2 "$WORKON_HOME/neovim2"
    "$WORKON_HOME/neovim2/bin/pip2" install neovim
fi

nvim +PlugInstall +qall
