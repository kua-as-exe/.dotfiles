#!/bin/bash
export ANDROID_SDK_ROOT=~/Android/Sdk 
export JAVA_HOME=~/Downloads/instalations/android-studio/jre 

PKG_ID=$(cat android/app/src/main/AndroidManifest.xml | grep "package" | grep -o "\"[a-z0-9.]*\"" | sed "s/\"//g" )

echo "Building and running $PKG_ID"

ionic capacitor build android
cd android 
./gradlew assembleDebug 
adb install app/build/outputs/apk/debug/app-debug.apk
cd ..

adb shell am start -n "$PKG_ID/$PKG_ID.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
