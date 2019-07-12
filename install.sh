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
    "insync      keyserver.ubuntu.com     ACCAF35C"
    "neovim      keyserver.ubuntu.com     8231B6DD"
    "node.js     https://deb.nodesource.com/gpgkey/nodesource.gpg.key 68576280"
    "rvm         keyserver.ubuntu.com     F4E3FBBE"
    "spotify     keyserver.ubuntu.com     48BF1C90"
)

# bhs: add a few ppas
export PPA_LIST=(
    "insync     http://apt.insynchq.com/ubuntu                      bionic non-free contrib"
    "neovim     http://ppa.launchpad.net/neovim-ppa/stable/ubuntu   bionic main"
    "node.js    https://deb.nodesource.com/node_10.x                bionic main"
    "rvm        http://ppa.launchpad.net/rael-gc/rvm/ubuntu         bionic main"
    "spotify    http://repository.spotify.com                       stable non-free"
#    bluez      http://ppa.launchpad.net/bluetooth/bluez/ubuntu     bionic main"
)

# bhs: packages to install
export PACKAGE_LIST=(
    apt-utils
    autocutsel
    build-essential
    cmake
    cmake
    cmake-data
    curl
    ddgr
    entr
    exuberant-ctags
    feh
    firefox
    flex
    fonts-powerline
    git
    i3
    i3-wm
    insync
    keychain
    libasound2-dev
    libcairo2-dev
    libcap-dev
    libcurl4-openssl-dev
    libcurl4-openssl-dev
    libelf-dev
    libev-dev
    libfontconfig1-dev
    libfreetype6-dev
    libidn11-dev
    libiw-dev
    libjpeg-dev
    libkrb5-dev
    libldap2-dev
    libmpdclient-dev
    libpam0g-dev
    libpq-dev
    libpulse-dev
    librtmp-dev
    libsasl2-dev
    libssl-dev
    libx11-xcb-dev
    libxcb-composite0-dev
    libxcb-ewmh-dev
    libxcb-icccm4-dev
    libxcb-image0-dev
    libxcb-randr0-dev
    libxcb-util-dev
    libxcb-util0-dev
    libxcb-xinerama0-dev
    libxcb-xkb-dev
    libxcb-xrm-dev
    libxcb1-dev
    libxkbcommon-dev
    libxkbcommon-x11-dev
    libxml2-dev
    mpv
    network-manager-openvpn
    network-manager-openvpn-gnome
    nodejs
    notify-osd
    openjdk-8-jdk
    openvpn
    pandoc
    pass
    pkg-config
    python-dev
    python-m2crypto
    python-pip
    python-xcbgen
    python3-dev
    python3-pip
    rofi
    ruby
    ruby-dev
    rvm
    rvm
    shellcheck
    silversearcher-ag
    spotify-client
    swig
    tmux
    tox
    virtualenv
    xautolock
    xcb-proto
    xclip
    yarn
#    blueman
#    weechat ## requires user input? hangs
#    zeal
)

export GLOBAL_NODE_PACKAGES=(
    diff-so-fancy
    eslint
    n
    neovim
    tern
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
    fd
    fonts
    gradle
    hugo
    i3lock-color
    neovim
    packer
    pass
    polybar
    powerline
    qutebrowser
    ripgrep
    slack
    solarize
    standard-notes
    terraform
    update-systemd-resolved
)

# A list of directories that should be created.
export CREATE_DIRS=(
    $APPS
    $BIN_DIR
    $DOWNLOADS
    $PROJECTS

    ~/.config/Standard\ Notes
    ~/.config/alacritty
    ~/.config/fontconfig/conf.d
    ~/.config/git
    ~/.config/i3
    ~/.config/polybar
    ~/.config/psql
    ~/.config/qutebrowser
    ~/.ipython/profile_default
    ~/.kitchen
    ~/.local/share/applications
    ~/.local/share/qutebrowser/userscripts
    ~/.weechat
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
    "${DOCUMENTS}/apps/qutebrowser/bookmarks    ~/.config/qutebrowser/bookmarks/urls"
    "${DOCUMENTS}/apps/qutebrowser/quickmarks   ~/.config/qutebrowser/quickmarks"
    "${DOTFILES}/scripts/qute-pass              ~/.local/share/qutebrowser/userscripts/qute-pass"
    "${RCS}/X/10-evdev.conf                     /etc/X11/xorg.conf.d/10-evdev.conf"
    "${RCS}/X/Xmodmap                           ~/.Xmodmap"
    "${RCS}/X/Xresources                        ~/.Xresources"
    "${RCS}/X/xinitrc                           ~/.xinitrc"
    "${RCS}/X/xorg.conf                         /etc/X11/xorg.conf"
    "${RCS}/X/xserverrc                         ~/.xserverrc"
    "${RCS}/X/xsessionrc                        ~/.xsessionrc"
    "${RCS}/alacritty.yml                       ~/.config/alacritty/alacritty.yml"
    "${RCS}/bash_profile                        ~/.bash_profile"
    "${RCS}/bashrc                              ~/.bashrc"
    "${RCS}/ctags                               ~/.ctags"
    "${RCS}/git/gitconfig                       ~/.config/git/config"
    "${RCS}/git/gitignore_global                ~/.config/git/ignore"
    "${RCS}/i3config                            ~/.config/i3/config"
    "${RCS}/ipython_config.py                   ~/.ipython/profile_default/ipython_config.py"
    "${RCS}/keyboard                            /etc/default/keyboard"
    "${RCS}/kitchen-config.yml                  ~/.kitchen/config.yml"
    "${RCS}/mimeapps.list                       ~/.config/mimeapps.list"
    "${RCS}/nvim/coc-settings.json              ~/.config/nvim/coc-settings.json"
    "${RCS}/polybar-config                      ~/.config/polybar/config"
    "${RCS}/psql/psqlrc                         ~/.psqlrc"
    "${RCS}/qutebrowser-config.py               ~/.config/qutebrowser/config.py"
    "${RCS}/qutebrowser-elsie.py                ~/.config/qutebrowser/elsie.py"
    "${RCS}/rvmrc                               ~/.rvmrc"
    "${RCS}/standard-notes-userprefs.json       ~/.config/Standard Notes/user-preferences.json"
    "${RCS}/weechat.conf                        ~/.weechat/weechat.conf"
)

# call bhs installer that will act on all the lists defined above
source "$SCAFFOLD_PATH/install.sh" "$*"
