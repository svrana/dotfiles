#!/bin/bash

if ! command -v fd > /dev/null ; then
    VERSION="6.3.0"
    FILENAME=fd-musl_${VERSION}_amd64.deb

    wget -P "$APPS" "https://github.com/sharkdp/fd/releases/download/v$VERSION/$FILENAME"
    sudo dpkg -i "$APPS/$FILENAME"

    rm "$APPS/$FILENAME"

    unset VERSION
    unset FILENAME
    unset DIRNAME
fi
