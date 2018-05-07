#!/usr/bin/env bash

function _load_deps() {
    local CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "$CURRENT_DIR/functions.sh"
    source "$CURRENT_DIR/directories.sh"
}

function _scaffold() {
    source "$PROJECTS/bash-home-scaffold/load.sh"
}

_load_deps
_scaffold
