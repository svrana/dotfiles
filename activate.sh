#
# Set up commonly used functions, aliases and environment variables used
# throughout these dotfiles.
#

if [ -n "${ZSH_VERSION}" ]; then
    current_dir=${0:a:h}
elif [ -n "${BASH_VERSION}" ]; then
    current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

export CONFIG_DIR="${current_dir}"
export SCRIPT_DIR="${CONFIG_DIR}/scripts"
export RC_DIR="${CONFIG_DIR}/rcs"
export MACHINE_DIR="${CONFIG_DIR}/boxen"

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/functions.sh"
source "$CONFIG_DIR/directories.sh"

#
# Source default configuration for all boxen
#
. "${MACHINE_DIR}/default.env"

#
# Source machine specific configuration if available
#
overrides=${MACHINE_DIR}/${HOSTNAME}.env
if [ -e "$overrides" ]; then
    . "$overrides"
fi

#
# Source machine specific private config if available
#
private_box_override="$CONFIG_DIR/private/boxen/${HOSTNAME}.env"
if [ -e "$private_box_override" ]; then
    . "$private_box_override"
fi

#
# Source private configs that cannot be added to the public repo
#
for file in $(dolisting "$CONFIG_DIR"/private/*.env)
do
    . "$file"
done

function dotfiles_activate_plugins() {
    [ -z "$DOTFILE_PLUGINS" ] && return

    for plugin in ${DOTFILE_PLUGINS[*]}
    do
	if [ ! -d "$CONFIG_DIR/plugins/${plugin}" ]; then
	    echo "Invalid plugin $plugin could not be loaded"
	    continue
	fi
	if [ ! -f "$CONFIG_DIR/plugins/$plugin/activate.sh" ]; then
	    echo "Plugin $plugin is missing activate.sh script"
	    continue
	fi
	#echo "Activating $plugin plugin"
	source "$CONFIG_DIR/plugins/${plugin}/activate.sh"
    done
}

dotfiles_activate_plugins

# Cleanup any invalid paths in PATH
PATH=$(cleaned_path)
export PATH
