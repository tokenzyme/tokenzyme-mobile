##!/bin/sh

sudo rm -Rf ~/.pub-cache
flutter clean
dart pub get
flutter pub get
