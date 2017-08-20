#
# Load dotfile dependencies, including functions and environment variables,
# and user specified plugins.
#

if [ -n "${ZSH_VERSION}" ]; then
    current_dir=${0:a:h}
elif [ -n "${BASH_VERSION}" ]; then
    current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

export DOTFILES_DIR="${current_dir}"
export SCRIPT_DIR="${DOTFILES_DIR}/scripts"
export RC_DIR="${DOTFILES_DIR}/rcs"
export MACHINE_DIR="${DOTFILES_DIR}/boxen"
unset current_dir

source "$DOTFILES_DIR/colors.sh"
source "$DOTFILES_DIR/functions.sh"
source "$DOTFILES_DIR/directories.sh"

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
private_box_override="$DOTFILES_DIR/private/boxen/${HOSTNAME}.env"
if [ -e "$private_box_override" ]; then
    . "$private_box_override"
fi
unset private_box_override

#
# Source private configs that cannot be added to the public repo
#
for file in $(dolisting "$DOTFILES_DIR"/private/*.env)
do
    . "$file"
done
unset file

function dotfiles_activate_plugins() {
    [ -z "$DOTFILE_PLUGINS" ] && return

    for plugin in ${DOTFILE_PLUGINS[*]}
    do
	if [ ! -f "$DOTFILES_DIR/plugins/${plugin}.sh" ]; then
	    echo "Plugin $plugin is missing"
	    continue
	fi
	#echo "Activating $plugin plugin"
	source "$DOTFILES_DIR/plugins/${plugin}.sh"
    done
    unset plugin
}

dotfiles_activate_plugins
