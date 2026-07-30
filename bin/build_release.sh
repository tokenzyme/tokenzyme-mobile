##!/bin/sh

rm -Rf ./build
flutter build appbundle
flutter build apk
#flutter build ipa --obfuscate --split-debug-info=build/app/outputs/symbols --export-options-plist=ios/ExportOptions.plist
cp build/app/outputs/bundle/release/app-release.aab build
cp build/app/outputs/apk/release/app-release.apk build
#cp build/ios/ipa/app-release.ipa build
