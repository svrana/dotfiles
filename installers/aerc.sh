#!/bin/bash

if [ ! -d "$APPS/scdoc" ]; then
    git clone https://git.sr.ht/~sircmpwn/scdoc  "$APPS/scdoc"
    pushd "$APPS/scdoc"
    make && sudo make install
    popd
fi

if [ ! -d "$APPS/aerc" ]; then
    git clone https://git.sr.ht/~sircmpwn/aerc "$APPS/aerc"
    pushd "$APPS/aerc"
    make && sudo make install
    popd
fi