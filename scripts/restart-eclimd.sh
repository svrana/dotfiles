#!/bin/bash

echo "Restarting eclimd"
pkill eclimd
remove-eclipse-workspace-lock.sh
run-eclimd.sh
