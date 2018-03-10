#!/usr/bin/env bash

DEST_DIR="$APPS/google-cloud-sdk"
VERSION="192.0.0"
FILENAME="google-cloud-sdk-$VERSION-linux-x86_64.tar.gz"
DEST_FILE="$APPS/$FILENAME"

if [ ! -d "$DEST_DIR" ]; then
    wget --show-progress \
        "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$FILENAME" -O "$DEST_FILE"
    tar xzvf "$DEST_FILE" -C "$APPS"
    rm "$DEST_FILE"
fi

if [ ! -f "$BIN_DIR/cfssl" ]; then
    wget -q --show-progress --https-only --timestamping     \
        https://pkg.cfssl.org/R1.2/cfssl_linux-amd64        \
        -O "$BIN_DIR/cfssl"
    chmod +x "$BIN_DIR/cfssl"
fi

if [ ! -f "$BIN_DIR/cfssljson" ]; then
    wget -q --show-progress --https-only --timestamping     \
        https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64    \
        -O "$BIN_DIR/cfssljson"
    chmod +x "$BIN_DIR/cfssljson"
fi

if [ ! -f "$BIN_DIR/kubectl" ]; then
    wget -q --show-progress  \
        https://storage.googleapis.com/kubernetes-release/release/v1.9.0/bin/linux/amd64/kubectl \
        -O "$BIN_DIR/kubectl"
    chmod +x "$BIN_DIR/kubectl"
fi
