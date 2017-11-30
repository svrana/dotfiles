mkdir -p ~/.config/nvim/{bak,swp}
mkdir -p ~/.config/nvim/after/ftplugin
mkdir -p ~/.config/nvim/bundle
mkdir -p ~/.config/nvim/autoload


function _link_ftplugins() {
    local i
    for i in $(dolisting rcs/ftplugin/*); do
        i=$(basename "$i")
        ln -sf "$DOTFILES/rcs/ftplugin/$i" ~/.config/nvim/after/ftplugin/"$i"
    done
}
_link_ftplugins

if [ ! -d ~/.config/nvim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
    estatus "Cloned Vundle"
fi

if [ ! -f ~/.config/nvim/init.vim ]; then
    mkdir ~/.config/nvim
    ln -sf "${RC_DIR}/vimrc" ~/.config/nvim/init.vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
fi


ln -sf "${RC_DIR}/vimrc" ~/.vimrc

function _go_config() {
    if [ -n "$GOPATH" -a ! -d "$GOPATH/src/github.com/nsf/gocode" ]; then
        go get -u github.com/nsf/gocode
        "$GOPATH/src/github.com/nsf/gocode/nvim/symlink.sh" > /dev/null 2>&1
    fi
}
_go_config

nvim +PluginInstall +qall +GoInstallBinaries
