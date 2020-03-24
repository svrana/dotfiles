#!/bin/bash

APPNAME="dbeaver-ce"
VERSION="7.0.1"
FILENAME="${APPNAME}_${VERSION}_amd64.deb"
URL="https://dbeaver.io/files/$VERSION/$FILENAME"

ext_package_install dbeaver-ce $VERSION $URL

unset APPNAME
unset VERSION
unset FILENAME
unset URL
