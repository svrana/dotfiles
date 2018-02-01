#!/bin/bash

set -e

if [ ! -d $APPS/nvm ]; then
    pushd "$APPS"
    git clone https://github.com/creationix/nvm.git
    cd nvm
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
    popd
fi
