#!/bin/bash

export rvmsudo_secure_path=1
export RVM_PATH=/usr/share/rvm

PATH_append $RVM_PATH/bin

[[ -s "$RVM_PATH/scripts/rvm" ]] && . "$RVM_PATH/scripts/rvm"

alias br='bundle exec rake'
alias be='bundle exec'
