#!/bin/bash
#
# Links configuration files to their correct places.
# Runs installers.
#

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
INSTALLERS=(
    cargo
    alacritty
    dbeaver
    fd
    go
    hugo
    neovim
    powerline
    ripgrep
    slack
    solarize
)

# A list of directories that should be created.
CREATE_DIRS=(
    $BIN_DIR
    $DOWNLOADS
    $APPS
    $PROJECTS

    ~/.config/alacritty
    ~/.config/psql
    ~/.config/fontconfig/conf.d
    ~/.config/git
    ~/.kitchen
    ~/.local/share/applications
    ~/.ipython/profile_default
)

# A list of symbolic links that point to directories that should be created.
DIR_LINKS=(
    # Target                        Link name
    "$CLOUD_ROOT/Documents          $DOCUMENTS"
    "$CLOUD_ROOT/Music              $MUSIC"
    "$CLOUD_ROOT/Pictures           $PHOTOS"
)

# A list of symbolic links pointing to files that should be created.
FILE_LINKS=(
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
    "${DOTFILES}/misc/Alacritty.desktop         ~/.local/share/applications"
    "$APPS/alacritty/target/release/alacritty   $BIN_DIR/alacritty"
)

#
# Runs each of the installers specified in the INSTALLERS array.
#
function _run_installers() {
    local plugins
    plugins=$(sed -rn '/export DOTFILE_PLUGINS=\(.*/','/\)/'p "$RCS/bashrc" | \
        sed 's/#.*//' | sed 's/export DOTFILE_PLUGINS=(//' | tr -d ')\n')

    for plugin in $plugins ; do
        local installer="$DOTFILES/installers/$plugin.sh"
        if [ -f "$installer" ]; then
            echo -n "Configuring $plugin"
            source "$installer"
            estatus
        fi
    done

    for installer in ${INSTALLERS[*]}; do
        local location="$DOTFILES/installers/${installer}.sh"
        if [ ! -f "$location" ]; then
            echo "Installer $installer missing"
            return 1
        fi
        echo -n "Configuring $installer"
        source "$location"
        estatus
    done
}

#
# Link each script in ./scripts to a directory in your path specified by
# $BIN_DIR.
#
function _prep_scripts() {
    local i
    local scripts="$DOTFILES/scripts"
    local -i count=0

    for i in $(dolisting "$scripts"/*) ; do
        chmod +x "$i"
        count=$((count+1))
    done
    egood "Added execute permission to $count scripts in ${scripts/$HOME\//\~/}"
    count=0

    for i in $(dolisting "$scripts/*") ; do
        i=$(basename "$i")
        ln -sf "${scripts}/$i" "${BIN_DIR}/$i"
        count=$((count+1))
    done

    egood "Created $count links to scripts in ${scripts/$HOME\//\~/} in ${BIN_DIR/$HOME\//\~/}"
}

#
# Run chef solo. Only for package installation at this time.
#
function _chef_bootstrap() {
    local force=${1:-"false"}
    local first_run

    first_run=$(which chef-solo)
    if [ -z "$first_run" ]; then
        curl -L https://omnitruck.chef.io/install.sh -o "$TMP/install.sh"
        sudo bash /tmp/install.sh -P chefdk
        estatus "Installed chefdk"
        rm /tmp/install.sh > /dev/null 2>&1
    fi

    if [[ -z "$first_run" || "$force" = "true" ]]; then
        "$DOTFILES/scripts/chef-up"
        estatus "Ran chef-solo"
    else
        egood "Skipped chef-solo run"
    fi
}

#
# Create a symbolic link for each entry speciied in the FILE_LINKS and
# DIR_LINKS arrays.
#
function _make_links() {
    local spec
    for link_spec in "${DIR_LINKS[@]}" ; do
        spec=$(echo "$link_spec" | tr -s ' ')
        local target=${spec%% *}
        local link=${spec#* }
        ln -Tsf "$target" "$link"
    done
    egood "Created directory links"

    for link_spec in "${FILE_LINKS[@]}" ; do
        spec=$(echo "$link_spec" | tr -s ' ')
        local target=${spec%% *}
        local link=${spec#* }
        ln -sf "$target" "${link/#~/$HOME}" # expand ~/ to $HOME
    done

    egood "Created file links"
}

#
# Create each direcctory specified in the CREATE_DIRS array.
#
function _make_dirs() {
    for dir in "${CREATE_DIRS[@]}" ; do
        mkdir -p "${dir/#~/$HOME}"
    done

    egood "Created default directories"
}

#
# If we're managing this bashrc, then source it to load all the plugins.
function _maybe_source_bashrc() {
    for link_spec in "${FILE_LINKS[@]}" ; do
        spec=$(echo "$link_spec" | tr -s ' ')
        link=${spec#* }
        # shellcheck disable=SC2088
        if [ "$link" = "~/.bashrc" ]; then
            echo -n "Sourcing .bashrc"
            . ~/.bashrc
            estatus
        fi
    done
}

force_chef_run="false"
while getopts f opt
do
    case "$opt" in
        f)  force_chef_run="true";;
        \?)   # unknown flag
            echo >&2 \
                "usage: $0 [-f force chef-solo run ]"
            exit 1;;
    esac
done
shift "$((OPTIND-1))"

_chef_bootstrap "$force_chef_run"
_make_dirs
_make_links
_prep_scripts
_run_installers
_maybe_source_bashrc