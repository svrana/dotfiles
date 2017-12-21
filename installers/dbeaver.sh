#!/bin/bash

APPNAME="dbeaver-ce"
TAG='latest_amd64'
FILENAME="${APPNAME}_$TAG.deb"

if [ ! -f "$APPS/$FILENAME" ]; then
    URL="https://dbeaver.jkiss.org/files/$FILENAME"
    wget -P "$APPS" "$URL"
    sudo dpkg -i "$APPS/$FILENAME"
fi

unset APPNAME
unset TAG
unset FILENAME
