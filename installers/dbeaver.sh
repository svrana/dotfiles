#!/bin/bash

APPNAME="dbeaver-ce"
VERSION="6.0.2"
FILENAME="${APPNAME}_${VERSION}_amd64.deb"

if [ ! -f "$APPS/$FILENAME" ]; then
    URL="https://dbeaver.io/files/$VERSION/$FILENAME"
    wget -P "$APPS" "$URL"
    sudo dpkg -i "$APPS/$FILENAME"
fi

unset APPNAME
unset VERSION
unset FILENAME
