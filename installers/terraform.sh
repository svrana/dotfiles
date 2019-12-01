#!/usr/bin/bash

function install() {
    VERSION=0.11.7
    NAME=terraform
    FILENAME="${NAME}_${VERSION}_linux_amd64.zip"
    DEST_DIR="/usr/local/bin"

    if [ -f "$DEST_DIR/$NAME" ]; then
        return
    fi

    TEMPDIR=$(mktemp -d)
    wget -P "$TEMPDIR" "https://releases.hashicorp.com/${NAME}/${VERSION}/${FILENAME}"
    pushd $TEMPDIR
    unzip "${TEMPDIR}/${FILENAME}" && \
    sudo mv ${NAME} /usr/local/bin/${NAME} && \
    popd
    rm -r "$TEMPDIR"
}

install
