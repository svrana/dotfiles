export ANDROID_HOME=~/android
export ANDROID_SDK=~/android
export ANDROID_SDK_ROOT=$ANDROID_HOME/sdk
export ANDROID_STUDIO=~/apps/android-studio

PATH_append $ANDROID_STUDIO/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$current_dir/functions.sh"
