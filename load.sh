#!/usr/bin/env bash

function _load_deps() {
    CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "$CURRENT_DIR/directories.sh"
    source "$CURRENT_DIR/functions.sh"
}

_load_deps
source "$PROJECTS/bash-home-scaffold/load.sh"
