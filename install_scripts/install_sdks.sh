#!/bin/bash

sudo pamac install unzip google-chrome --no-confirm

flutterDir="$REPOS/flutter"
[[ ! -d "$flutterDir" ]] && git clone "https://github.com/flutter/flutter" "$flutterDir"

(cd "$flutterDir" && git checkout stable)
# source "$flutterDir/bin/flutter" channel stable
source "$flutterDir/bin/flutter" upgrade
source "$flutterDir/bin/flutter" doctor

