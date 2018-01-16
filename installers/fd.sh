#!/bin/bash

if [ ! -f "$BIN_DIR/fd" ]; then
    VERSION="v6.0.0"
    FILENAME=fd-${VERSION}-x86_64-unknown-linux-musl.tar.gz
    DIRNAME=${FILENAME%.tar.gz}
    TEMPDIR=$(mktemp -d)

    wget -P "$TEMPDIR" "https://github.com/sharkdp/fd/releases/download/$VERSION/$FILENAME"
    tar xzvf "$TEMPDIR/$FILENAME" -C "$TEMPDIR"
    cp "$TEMPDIR/$DIRNAME/fd" "$BIN_DIR"
    rm -r "$TEMPDIR"

    unset VERSION
    unset FILENAME
    unset DIRNAME
fi
