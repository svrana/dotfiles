#
# This file exists so that it can be sourced in the install script, where
# sourcing the .bashrc or activate.sh is not appropriate b/c the dotfiles
# have not been installed yet. These must be set prior to install so that
# applications can be placed in the right place.
#

export TMP=/tmp
export CLOUD_ROOT=~/Cloud
export PHOTOS=~/Pictures
export BIN_DIR=~/.local/bin
export DOCUMENTS=~/Documents
export DOWNLOADS=~/Downloads
export MUSIC=~/Music
export PROJECTS=~/Projects
export APPS=~/Apps


current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export DOTFILES_DIR="${current_dir}"
export SCRIPT_DIR="${DOTFILES_DIR}/scripts"
export RC_DIR="${DOTFILES_DIR}/rcs"
export MACHINE_DIR="${DOTFILES_DIR}/boxen"

unset current_dir
