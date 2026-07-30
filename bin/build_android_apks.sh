##!/bin/sh

if [[ -z "$BUNDLE_TOOL_PATH" ]]; then
  echo "Variable BUNDLE_TOOL_PATH is not set"
  exit
fi

echo "Using bundle tool from: $BUNDLE_TOOL_PATH"

echo ""
read -p "Keystore file: " KEYSTORE_FILE
read -p "Keystore password: " KEYSTORE_PASS
read -p "Keystore key alias: " KEYSTORE_KEY_ALIAS
read -p "Keystore key password: " KEYSTORE_KEY_PASS

echo ""
echo "Generating app bundle..."
flutter build appbundle
if [ $? -ne 0 ]; then
  echo "Failed to generate app bundle"
  exit
fi

echo ""
echo "Generating APKs from app bundle..."
java -jar $BUNDLE_TOOL_PATH build-apks \
  --bundle ./build/app/outputs/bundle/release/app-release.aab \
  --output ./build/app/outputs/bundle/release/app-release.apks \
  --ks $KEYSTORE_FILE \
  --ks-pass 'pass:'$KEYSTORE_PASS \
  --ks-key-alias $KEYSTORE_KEY_ALIAS \
  --key-pass 'pass:'$KEYSTORE_KEY_PASS --overwrite
if [ $? -eq 0 ]; then
  echo "APKs generated successfully!"
else
  echo "Failed to generate APKs"
fi
