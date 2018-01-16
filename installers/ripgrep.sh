#!/bin/bash

if [ ! -f "$BIN_DIR/rg" ]; then
    VERSION="0.7.1"
    FILENAME=ripgrep-${VERSION}-x86_64-unknown-linux-musl.tar.gz
    DIRNAME=${FILENAME%.tar.gz}
    TEMPDIR=$(mktemp -d)

    wget -P "$TEMPDIR" "https://github.com/BurntSushi/ripgrep/releases/download/$VERSION/$FILENAME"
    tar xzvf "$TEMPDIR/$FILENAME" -C "$TEMPDIR"
    cp "$TEMPDIR/$DIRNAME/rg" "$BIN_DIR"
    rm -rf "$TEMPDIR"

    unset VERSION
    unset FILENAME
    unset DIRNAME
fi
