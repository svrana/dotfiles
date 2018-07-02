#!/usr/bin/bash

function install() {
    VERSION=0.11.7
    NAME=terraform
    FILENAME="${NAME}_${VERSION}_linux_amd64.zip"
    DEST_DIR="/usr/local/bin"

    if [ -f "$DEST_DIR/$NAME" ]; then
        return
    fi

    wget -P "$DOWNLOADS" "https://releases.hashicorp.com/${NAME}/${VERSION}/${FILENAME}"
    unzip "${DOWNLOADS}/${FILENAME}"
    sudo mv ${NAME} /usr/local/bin/${NAME}
    rm "${DOWNLOADS}/$FILENAME"
}

install
