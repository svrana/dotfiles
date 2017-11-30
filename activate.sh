#!/bin/bash
#
# Load dotfile dependencies, including functions and environment variables,
# and user specified plugins.
#

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/directories.sh"
source "$CURRENT_DIR/functions.sh"

unset CURRENT_DIR

PATH_append "$BIN_DIR"

#
# Source machine specific configuration if available
#
overrides=${MACHINE_DIR}/${HOSTNAME}.env
if [ -e "$overrides" ]; then
    . "$overrides"
fi
unset overrides

#
# Source machine specific private config if available
#
private_box_override="$DOTFILES/private/boxen/${HOSTNAME}.env"
if [ -e "$private_box_override" ]; then
    . "$private_box_override"
fi
unset private_box_override

#
# Source private configs that cannot be added to the public repo
#
for file in $(dolisting "$DOTFILES"/private/*.env)
do
    . "$file"
done
unset file

function __dotfiles_activate_plugins() {
    [ -z "$DOTFILE_PLUGINS" ] && return

    local plugin
    for plugin in ${DOTFILE_PLUGINS[*]}
    do
        if [ ! -f "$DOTFILES/plugins/${plugin}.sh" ]; then
            echo "Plugin $plugin is missing"
            continue
        fi
        #echo "Activating $plugin plugin"
        source "$DOTFILES/plugins/${plugin}.sh"
    done
}

__dotfiles_activate_plugins
