#!/usr/bin/env bash


if [ ! -f "$BIN_DIR/eksctl" ]; then
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl "$BIN_DIR/eksctl"

fi

if [ ! -f "$BIN_DIR/aws-iam-authenticator" ]; then
    curl -o "$BIN_DIR/aws-iam-authenticator" https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
    chmod +x "$BIN_DIR/aws-iam-authenticator"
fi
