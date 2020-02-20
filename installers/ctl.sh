#!/bin/bash

if [ ! -f "$BIN_DIR/ctl" ]; then
    git clone git@github.com:wish/ctl.git "${APPS}/ctl"
    pushd "${APPS}/ctl" > /dev/null
    make
    mv bin/linux/ctl "$BIN_DIR/ctl"
    popd > /dev/null
fi
