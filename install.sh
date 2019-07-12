#!/bin/bash
#
# Configure bash-home-scaffold (bhs) and run its install script.

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

_install_deps=(
    directories.sh  # directory names are used throughout
    functions.sh    # used for helper functions
    plugins/go.sh   # neovim installer uses go
)

for dep in "${_install_deps[@]}" ; do
    . "$CURRENT_DIR/$dep"
done
unset _install_deps


# bhs: fetch the gpg key ids from the keyservers
export PPA_KEYS=(
    "spotify     keyserver.ubuntu.com     48BF1C90"
    "insync      keyserver.ubuntu.com     ACCAF35C"
    "neovim      keyserver.ubuntu.com     8231B6DD"
    "rvm         keyserver.ubuntu.com     F4E3FBBE"
    "node.js     https://deb.nodesource.com/gpgkey/nodesource.gpg.key 68576280"
)

# bhs: add a few ppas
export PPA_LIST=(
    "spotify    http://repository.spotify.com                       stable non-free"
    "insync     http://apt.insynchq.com/ubuntu                      bionic non-free contrib"
    "neovim     http://ppa.launchpad.net/neovim-ppa/stable/ubuntu   bionic main"
    "rvm        http://ppa.launchpad.net/rael-gc/rvm/ubuntu         bionic main"
    "node.js    https://deb.nodesource.com/node_10.x                bionic main"
#    bluez      http://ppa.launchpad.net/bluetooth/bluez/ubuntu     bionic main"
)

# bhs: packages to install
export PACKAGE_LIST=(
    keychain
    rvm
    nodejs
    autocutsel
    #blueman
    build-essential
    curl
    ddgr
    fonts-powerline
    pass
    python-pip
    python-dev
    python3-dev
    python3-pip
    git
    tox
    tmux
    xclip
    openvpn
    openjdk-8-jdk
    exuberant-ctags
    silversearcher-ag
    libcurl4-openssl-dev
    libcap-dev
    libxml2-dev
    libldap2-dev
    libidn11-dev
    librtmp-dev
    libkrb5-dev
    python-m2crypto
    libsasl2-dev
    libssl-dev
    swig
    network-manager-openvpn
    network-manager-openvpn-gnome
    shellcheck
    ruby
    ruby-dev
    libpq-dev
    rvm
    spotify-client
#    zeal
    insync
    firefox
    virtualenv
    cmake
    flex
    libelf-dev
    libev-dev
    libfreetype6-dev
    libfontconfig1-dev
    libjpeg-dev
    libpam0g-dev
    pandoc
    entr
#    weechat ## requires user input? hangs
    yarn
    i3
    feh
    xautolock
    rofi
    cmake
    cmake-data
    libcairo2-dev
    libx11-xcb-dev
    libxcb1-dev
    libxcb-util-dev
    libxcb-ewmh-dev
    libxcb-icccm4-dev
    libxcb-image0-dev
    libxcb-randr0-dev
    libxcb-util0-dev
    libxcb-xkb-dev
    libxcb-xinerama0-dev
    libxkbcommon-dev
    libxkbcommon-x11-dev
    pkg-config
    python-xcbgen
    xcb-proto
    libxcb-xrm-dev
    i3-wm
    libasound2-dev
    libmpdclient-dev
    libiw-dev
    libcurl4-openssl-dev
    libpulse-dev
    libxcb-composite0-dev
    notify-osd
    mpv
)

export GLOBAL_NODE_PACKAGES=(
    neovim
    diff-so-fancy
    eslint
    tern
    n
)

export GLOBAL_GEMS=(
    neovim
)

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
    fonts
    gradle
    hugo
    i3lock-color
    packer
    pass
    polybar
    powerline
    ripgrep
    slack
    solarize
    standard-notes
    terraform
    qutebrowser
    update-systemd-resolved
)

# A list of directories that should be created.
export CREATE_DIRS=(
    $BIN_DIR
    $DOWNLOADS
    $APPS
    $PROJECTS

    ~/.config/alacritty
    ~/.config/qutebrowser
    ~/.config/psql
    ~/.config/i3
    ~/.config/polybar
    ~/.config/fontconfig/conf.d
    ~/.config/git
    ~/.config/Standard\ Notes
    ~/.kitchen
    ~/.local/share/applications
    ~/.ipython/profile_default
    ~/.weechat
    ~/.local/share/qutebrowser/userscripts
)

# A list of symbolic links that point to directories that should be created.
export DIR_LINKS=(
    # Target                        Link name
    "$CLOUD_ROOT/Documents          $DOCUMENTS"
    "$CLOUD_ROOT/Music              $MUSIC"
    "$CLOUD_ROOT/Pictures           $PHOTOS"
)

# bhs: A list of symbolic links pointing to files that should be created.
export FILE_LINKS=(
    # Target                                    Link name
    "${RCS}/alacritty.yml                       ~/.config/alacritty/alacritty.yml"
    "${RCS}/bash_profile                        ~/.bash_profile"
    "${RCS}/bashrc                              ~/.bashrc"
    "${RCS}/git/gitconfig                       ~/.config/git/config"
    "${RCS}/git/gitignore_global                ~/.config/git/ignore"
    "${RCS}/rvmrc                               ~/.rvmrc"
    "${RCS}/psql/psqlrc                         ~/.psqlrc"
    "${RCS}/kitchen-config.yml                  ~/.kitchen/config.yml"
    "${RCS}/ctags                               ~/.ctags"
    "${RCS}/ipython_config.py                   ~/.ipython/profile_default/ipython_config.py"
    "${RCS}/weechat.conf                        ~/.weechat/weechat.conf"
    "${RCS}/standard-notes-userprefs.json       ~/.config/Standard Notes/user-preferences.json"
    "${RCS}/i3config                            ~/.config/i3/config"
    "${RCS}/polybar-config                      ~/.config/polybar/config"
    "${RCS}/X/Xresources                        ~/.Xresources"
    "${RCS}/X/Xmodmap                           ~/.Xmodmap"
    "${RCS}/X/xinitrc                           ~/.xinitrc"
    "${RCS}/X/xserverrc                         ~/.xserverrc"
    "${RCS}/X/xsessionrc                        ~/.xsessionrc"
    "${RCS}/X/xorg.conf                         /etc/X11/xorg.conf"
    "${RCS}/X/10-evdev.conf                     /etc/X11/xorg.conf.d/10-evdev.conf"
    "${RCS}/qutebrowser-config.py               ~/.config/qutebrowser/config.py"
    "${RCS}/qutebrowser-elsie.py                ~/.config/qutebrowser/elsie.py"
    "${DOCUMENTS}/apps/qutebrowser/quickmarks   ~/.config/qutebrowser/quickmarks"
    "${DOCUMENTS}/apps/qutebrowser/bookmarks    ~/.config/qutebrowser/bookmarks/urls"
    "${DOTFILES}/scripts/qute-pass              ~/.local/share/qutebrowser/userscripts/qute-pass"
    "${RCS}/mimeapps.list                       ~/.config/mimeapps.list"
    "${RCS}/nvim/coc-settings.json              ~/.config/nvim/coc-settings.json"
    "${RCS}/keyboard                            /etc/default/keyboard"
)

# call bhs installer that will act on all the lists defined above
source "$SCAFFOLD_PATH/install.sh" "$*"
