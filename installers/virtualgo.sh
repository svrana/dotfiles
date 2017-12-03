#!/bin/bash

if ! which vg > /dev/null ; then
    go get -u github.com/GetStream/vg
fi
