#!/bin/bash
#
# Configure bash-home-scaffold and run its install script.

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

_install_deps=(
    directories.sh  # directory names are used throughout
    functions.sh    # used for helper functions
    plugins/go.sh   # neovim installer uses go
)

# Must have directories set so applications no where to be installed
for dep in "${_install_deps[@]}" ; do
    . "$CURRENT_DIR/$dep"
done

# A list of installers in $DOTFILES/installers that will be sourced during
# install. These are typically actions that need only be done once and for
# which there might not be a corresponding plugin.
#
# All installers with the same name of a plugin in your DOTFILES_PLUGINS
# are sourced automatically.
export INSTALLERS=(
    cargo
    alacritty
    dbeaver
    neovim
    fd
    go
    gradle
    hugo
    k8s
    neovim
    packer
    powerline
    ripgrep
    slack
    solarize
    standard-notes
    terraform
    update-systemd-resolved
)

# A list of directories that should be created.
export CREATE_DIRS=(
    $BIN_DIR
    $DOWNLOADS
    $APPS
    $PROJECTS

    ~/.config/alacritty
    ~/.config/psql
    ~/.config/fontconfig/conf.d
    ~/.config/git
    ~/.config/Standard\ Notes
    ~/.kitchen
    ~/.local/share/applications
    ~/.ipython/profile_default
    ~/.weechat
)

# A list of symbolic links that point to directories that should be created.
export DIR_LINKS=(
    # Target                        Link name
    "$CLOUD_ROOT/Documents          $DOCUMENTS"
    "$CLOUD_ROOT/Music              $MUSIC"
    "$CLOUD_ROOT/Pictures           $PHOTOS"
)

# A list of symbolic links pointing to files that should be created.
export FILE_LINKS=(
    # Target                                    Link name
    "${RCS}/bash_profile                        ~/.bash_profile"
    "${RCS}/bashrc                              ~/.bashrc"
    "${RCS}/gitconfig                           ~/.config/git/config"
    "${RCS}/gitignore_global                    ~/.config/git/ignore"
    "${RCS}/rvmrc                               ~/.rvmrc"
    "${RCS}/psqlrc                              ~/.psqlrc"
    "${RCS}/kitchen-config.yml                  ~/.kitchen/config.yml"
    "${RCS}/ctags                               ~/.ctags"
    "${RCS}/ipython_config.py                   ~/.ipython/profile_default/ipython_config.py"
    "${RCS}/alacritty.yml                       ~/.config/alacritty/alacritty.yml"
    "${RCS}/weechat.conf                        ~/.weechat/weechat.conf"
    "${RCS}/standard-notes-userprefs.json       ~/.config/Standard Notes/user-preferences.json"
)

source "$PROJECTS/bash-home-scaffold/install.sh" "$*"
