#!/bin/bash

if [ ! -d "$APPS/gruf" ]; then
    git clone git@github.com:svrana/gruf.git "$APPS/gruf"
    estatus "Cloned gruf"
fi
