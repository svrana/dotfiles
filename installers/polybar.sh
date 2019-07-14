#!/bin/bash

if [ ! -d "$APPS/polybar" ]; then
	git clone https://github.com/polybar/polybar.git "$APPS/polybar"
	pushd "$APPS/polybar"
    mkdir build
    cd build
    cmake ..
    make -j8
    sudo make install
	popd

fi
