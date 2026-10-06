#!/usr/bin/env bash
# À lancer après « npx cap add android » : autorise Internet, caméra et galerie.
set -e
M=android/app/src/main/AndroidManifest.xml
add(){ grep -q "$1" "$M" || sed -i "s#<application#$2\n    <application#" "$M"; }
add 'android.permission.INTERNET' '<uses-permission android:name="android.permission.INTERNET" />'
add 'android.permission.CAMERA' '<uses-permission android:name="android.permission.CAMERA" />'
add 'android.permission.READ_MEDIA_IMAGES' '<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />'
add 'android.hardware.camera' '<uses-feature android:name="android.hardware.camera" android:required="false" />'
echo "Permissions ajoutées."
