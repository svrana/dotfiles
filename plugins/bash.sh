#!/bin/bash

set -o vi
shopt -s checkwinsize
shopt -s histappend
shopt -s cdspell                  # Let bash help you change directories when you can't spell

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
