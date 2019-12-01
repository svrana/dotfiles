#!/bin/bash

if [ ! -z "$TRAVIS" ]; then
    egood "Skipping polybar build on CI"
    return
fi

if [ ! -d "$APPS/polybar" ]; then
	git clone https://github.com/polybar/polybar.git "$APPS/polybar"
	pushd "$APPS/polybar"
    ./build.sh --all-features -g -A
	popd
fi
