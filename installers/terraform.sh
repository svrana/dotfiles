#!/usr/bin/bash

function install() {
    VERSION=0.11.7
    FILENAME="terraform_${VERSION}_linux_amd64.zip"
    wget -P "$DOWNLOADS" "https://releases.hashicorp.com/terraform/${VERSION}/${FILENAME}"
    unzip "${DOWNLOADS}/${FILENAME}"
    sudo mv terraform /usr/local/bin/terraform
    rm "${DOWNLOADS}/$FILENAME"
}

install
