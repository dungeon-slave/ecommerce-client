#!/bin/bash

PRE_BUILD_SCRIPT="pre_build_script.sh"
PUBSPEC="pubspec.yaml"
PUBSPEC_LOCK="pubspec.lock"

PROJECT_PATH=$(pwd)
DEPTH=3

pre_build_package() {
    local package_path=$1

    echo -e "\n\n-> Running prebuild in $package_path\n\n"

    flutter clean

    if [ -e "$PUBSPEC_LOCK" ]; then
        rm "$PUBSPEC_LOCK" 
    fi

    flutter pub get

    if [ -e "$PRE_BUILD_SCRIPT" ] && [ "$package_path" != "$PROJECT_PATH" ]; then
        "./$PRE_BUILD_SCRIPT"
    fi   
}

pre_build_project() {
  local path=$1
  local depth=$2

  if [ "$depth" -le 0 ]; then
    return
  fi

  for folder in "$path"/*/; do
    cd "$folder" 2>/dev/null || continue

    if [ -e "$PUBSPEC" ]; then
        pre_build_package "$folder"
    fi

    cd "$PROJECT_PATH"

    pre_build_project "$folder" "$((depth - 1))"
  done
}

time pre_build_project "$PROJECT_PATH" "$DEPTH"
