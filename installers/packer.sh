#!/usr/bin/bash

function install() {
    VERSION=1.4.5
    NAME="packer"
    FILENAME="${NAME}_${VERSION}_linux_amd64.zip"
    DEST_DIR='/usr/local/bin'

    if [ -f "$DEST_DIR/$NAME" ]; then
        return
    fi

    TEMPDIR=$(mktemp -d)
    echo "Unzipping to $TEMPDIR"
    wget -P "$TEMPDIR" "https://releases.hashicorp.com/${NAME}/${VERSION}/${FILENAME}" && \
    pushd "$TEMPDIR"
    unzip "${TEMPDIR}/${FILENAME}" && \
    sudo mv "${NAME}" "/usr/local/bin/${NAME}" && \
    popd
    rm -r "${TEMPDIR}"
}

install
