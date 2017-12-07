#!/bin/bash

APPNAME="DBGlass"

if [ ! -f "$BIN_DIR/dbglass" ]; then
    TAG='v0.1.0-beta.6'
    FILENAME='linux-x64.tar.gz'
    URL="https://github.com/web-pal/DBGlass/releases/download/$TAG/$FILENAME"
    DIRECTORY="$APPNAME-linux-x64"

    wget -P "$DOWNLOADS" "$URL"
    tar xzvf "$DOWNLOADS/$FILENAME" -C "$APPS"
    mv "$APPS/$DIRECTORY" "$APPS/$APPNAME"
    ln -s "$APPS/$APPNAME/$APPNAME" "$BIN_DIR/dbglass"
    rm "$DOWNLOADS/$FILENAME"
fi
