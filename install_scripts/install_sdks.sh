#!/bin/bash

sudo pamac install unzip google-chrome android-studio --no-confirm

flutterDir="$REPOS/flutter"
[[ ! -d "$flutterDir" ]] && git clone "https://github.com/flutter/flutter" "$flutterDir"

source "$flutterDir/bin/flutter" channel stable
source "$flutterDir/bin/flutter" upgrade
source "$flutterDir/bin/flutter" doctor

