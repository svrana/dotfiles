#!/bin/bash

export TMP=/tmp
export CLOUD_ROOT=~/Cloud
export PHOTOS=~/Pictures
export DOCUMENTS=~/Documents
export DOWNLOADS=~/Downloads
export MUSIC=~/Music
export PROJECTS=~/Projects
export APPS=~/Apps


cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export DOTFILES="${cwd}"
export RCS="${DOTFILES}/rcs"
unset cwd

# required by bash_home_scaffold
export DOTFILES_BASHRC="$DOTFILES/rcs/bashrc"
export BIN_DIR=~/.local/bin
