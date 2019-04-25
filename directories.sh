#!/bin/bash

export TMP=/tmp
export CLOUD_ROOT=~/Cloud
export PHOTOS=~/Pictures
export DOCUMENTS=~/Documents
export DOWNLOADS=~/Downloads
export MUSIC=~/Music
export PROJECTS=~/Projects
export APPS=~/Apps
export SCAFFOLD_PATH=${SCAFFOLD_PATH:-$PROJECTS/bash-home-scaffold}


cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export DOTFILES="${cwd}"
export RCS="${DOTFILES}/configs"
unset cwd

# required by bash_home_scaffold
export DOTFILES_BASHRC="$RCS/bashrc"
export BIN_DIR=~/.local/bin
