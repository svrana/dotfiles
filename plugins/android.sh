export ANDROID_HOME=~/android
export ANDROID_SDK=~/android
export ANDROID_SDK_ROOT=$ANDROID_HOME/sdk
export ANDROID_STUDIO=~/apps/android-studio

PATH_append $ANDROID_STUDIO/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools

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
