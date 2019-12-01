#!/bin/bash

if [ ! -z "$TRAVIS" ]; then
    egood "skipping i3lock color compile on travis to avoid timeout"
    return
fi

if [ ! -d $APPS/i3lock-color ]; then
    git clone https://github.com/PandorasFox/i3lock-color.git $APPS/i3lock-color
    pushd $APPS/i3lock-color
    autoreconf -i && ./configure && cd x86_64-pc-linux-gnu && make -j8 && sudo make install
fi

if [ ! -d "$APPS/autotiling" ]; then
    git clone https://github.com/nwg-piotr/autotiling $APPS/autotiling
fi
