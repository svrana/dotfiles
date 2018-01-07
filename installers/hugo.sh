#!/bin/bash

which hugo > /dev/null
if [ $? = 1 ]; then
    go get github.com/kardianos/govendor
    govendor get github.com/gohugoio/hugo
    go install github.com/gohugoio/hugo
fi
