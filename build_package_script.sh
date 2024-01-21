#!/bin/bash

FLUTTER_PACKAGE_PATH=$1
CURRENT_PATH=$(pwd)

pre_build_package() {
  cd $FLUTTER_PACKAGE_PATH

  flutter clean
  rm pubspec.lock
  flutter pub get

  cd $CURRENT_PATH
}

pre_build_package
