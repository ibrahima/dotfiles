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

function adb_nexus5(){
    export ANDROID_SERIAL=039df0ef437cc1ab
}

function adb_mem(){
    export ANDROID_SERIAL=70fe60d8
}

function adb_mdp(){
    export ANDROID_SERIAL=b176271d
}

function adb_8660(){
    export ANDROID_SERIAL=226cf816
}
function make_381(){
    export PATH=/usr/local/make-3.81/bin:$PATH
}

alias adb_logfps='adb logcat -v time CALCFPS:D *:S'

function adb_browse_to(){
    adb shell am start -a android.intent.action.VIEW -d "$1"
}

function adb_tap_urlbar(){
    adb shell input tap 100 50
}
function goto_bbench(){
    adb shell input keyevent 67
    adb shell input text "file:///sdcard/bbench/index.html"
    adb shell input keyevent 66
}

function bbench_start(){
    adb shell input tap 15 420
}
