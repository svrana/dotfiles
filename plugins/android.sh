#!/bin/bash

export ANDROID_HOME=~/.android
export ANDROID_SDK=~/.android-sdk
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_STUDIO=~/Apps/android-studio

PATH_append $ANDROID_STUDIO/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools


apk_install() {
    local filename=${1}

    if [ -z "$filename" ]; then
        echo "Requires filename of .apk to install"
        return 1
    fi


    id=$(adb devices | grep device$ | awk -F '\\t' '{ print $1}')
    echo "Installing $filename to device $id"
    adb install -r "$filename"
}
