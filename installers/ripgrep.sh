#!/bin/bash

if [ ! -f "$BIN_DIR/rg" ]; then
    VERSION="0.7.1"
    FILENAME=ripgrep-${VERSION}-x86_64-unknown-linux-musl.tar.gz
    DIRNAME=${FILENAME%.tar.gz}

    wget -P "$DOWNLOADS" "https://github.com/BurntSushi/ripgrep/releases/download/$VERSION/$FILENAME"
    tar xzvf "$DOWNLOADS/$FILENAME" -C "$DOWNLOADS"
    cp "$DOWNLOADS/$DIRNAME/rg" "$BIN_DIR"
    rm -r "${DOWNLOADS:?}/$DIRNAME"
    rm "$DOWNLOADS/$FILENAME"

    unset VERSION
    unset FILENAME
    unset DIRNAME
fi
