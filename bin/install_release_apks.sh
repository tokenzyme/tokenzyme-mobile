##!/bin/sh

if [[ -z "$BUNDLE_TOOL_PATH" ]]; then
  echo "Variable BUNDLE_TOOL_PATH is not set"
  exit
fi

if [[ -z "$ANDROID_HOME" ]]; then
  echo "Variable ANDROID_HOME is not set"
  exit
fi

echo "Using bundle tool from: $BUNDLE_TOOL_PATH"

echo ""
echo "Installing APKs..."
java -jar $BUNDLE_TOOL_PATH install-apks \
  --apks=./build/app/outputs/bundle/release/app-release.apks
if [ $? -eq 0 ]; then
  echo "APKs installed successfully!"
else
  echo "Failed to install APKs"
fi
