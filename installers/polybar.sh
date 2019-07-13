#!/bin/bash

if [ ! -d "$APPS/polybar" ]; then
	git clone https//github.com/jaagr/polybar.git "$APPS/polybar"
	pushd "$APPS/polybar"
    ./build.sh
  	sudo make install
	popd

fi
