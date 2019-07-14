#!/bin/bash

if [ ! -d "$APPS/solarize" ]; then
    git clone https://github.com/svrana/solarize.git "$APPS/solarize"
    "$APPS/solarize/solarize.sh" dark
fi
