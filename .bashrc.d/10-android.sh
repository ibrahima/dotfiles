#!/usr/bin/env bash

export PATH=~/android/sdk/platform-tools:~/android/sdk/tools:$PATH
export ANDROID_HOME=~/android/sdk

# Use ccache with the Android build system
export USE_CCACHE=1
function runactivity() {
    local activity_name=${2:-MainActivity}
    adb shell am start -n $1/.$activity_name
}

function runvnc() {
    runactivity org.onaips.vnc
}

alias adb_logfps='adb logcat -v time CALCFPS:D *:S'

function adb_browse_to(){
    adb shell am start -a android.intent.action.VIEW -d "$1"
}
