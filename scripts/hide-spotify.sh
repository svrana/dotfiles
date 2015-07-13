#!/bin/bash

wget http://raw.github.com/ozcanesen/spotify-indicator/master/spotify -O /tmp/spotify
sudo cp /tmp/spotify /etc/apparmor.d/
sudo service apparmor reload
