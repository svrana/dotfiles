function install_apk() {
    if [ -z "$1" ]; then
        echo "Requires filename"
        return 1
    fi

    APK_FILENAME=$1

    id=$(adb devices | grep device$ | awk -F '\\t' '{ print $1}')
    echo "Installing $APK_FILENAME to device $id"
    adb install -r "$APK_FILENAME"
}

