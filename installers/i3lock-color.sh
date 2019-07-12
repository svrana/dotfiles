#!/bin/bash

if [ ! -d $APPS/i3lock-color ]; then
    git clone git@github.com:PandorasFox/i3lock-color.git $APPS/i3lock-color
    pushd $APPS/i3lock-color
    autoreconf -i && ./configure && cd x86_64-pc-linux-gnu && make -j8 && sudo make install
fi

