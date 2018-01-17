#!/bin/bash

APPNAME="dbeaver-ee"
TAG='latest_amd64'
FILENAME="${APPNAME}_$TAG.deb"

if [ ! -f "$APPS/$FILENAME" ]; then
    URL="https://dbeaver.com/files/$FILENAME"
    wget -P "$APPS" "$URL"
    sudo dpkg -i "$APPS/$FILENAME"
fi

unset APPNAME
unset TAG
unset FILENAME
