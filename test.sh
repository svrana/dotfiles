#!/bin/bash

# comment out https override since I do not store the keys in this repo
sed -i '/git@github.com/, /github.com\// s/^/#/' configs/git/gitconfig

dev dots sh cd ~/Projects/bash-home-scaffold && git pull

dev dots sh ./install.sh

# remove hack above
sed -i '/git@github.com/, /github.com\// s/^#//' configs/git/gitconfig
