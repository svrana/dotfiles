#!/bin/bash

if ! command -v hugo > /dev/null ; then
    go get github.com/magefile/mage
    go get -d github.com/gohugoio/hugo
    pushd "${GOPATH:-$HOME/go}/src/github.com/gohugoio/hugo" > /dev/null
    mage vendor
    mage install
    popd > /dev/null
fi
