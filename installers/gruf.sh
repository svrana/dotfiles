#!/bin/bash

if [ ! -d "$APPS/gruf" ]; then
    git clone https://github.com/svrana/gruf.git "$APPS/gruf"
    estatus "Cloned gruf"
fi
