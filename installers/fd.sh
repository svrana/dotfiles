#!/bin/bash

if [ ! -f "$BIN_DIR/fd" ]; then
    VERSION="v6.0.0"
    FILENAME=fd-${VERSION}-x86_64-unknown-linux-musl.tar.gz
    DIRNAME=${FILENAME%.tar.gz}

    wget -P "$DOWNLOADS" "https://github.com/sharkdp/fd/releases/download/$VERSION/$FILENAME"
    tar xzvf "$DOWNLOADS/$FILENAME" -C "$DOWNLOADS"
    cp "$DOWNLOADS/$DIRNAME/fd" "$BIN_DIR"
    rm -r "${DOWNLOADS:?}/$DIRNAME"
    rm "$DOWNLOADS/$FILENAME"

    unset VERSION
    unset FILENAME
    unset DIRNAME
fi
