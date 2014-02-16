#!/bin/bash

filename=screenshot.png
if [ ! -z "$1" ]; then
    filename=$1
fi

java -jar ~/apps/android-screenshot.jar -d $filename
ls -al $filename
