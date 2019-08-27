#!/bin/bash

function __install_gradle() {
    local version="5.6"
    local filename="gradle-${version}-bin.zip"
    local url="https://services.gradle.org/distributions/$filename"
    if [ ! -d "$APPS/gradle" ]; then
        pushd "$APPS"
        wget "$url"
        unzip -d "$APPS" "$APPS/$filename"
        mv "$APPS/gradle-$version" "$APPS/gradle"
        popd
    fi
}

__install_gradle
