#!/bin/bash

echo -e "\033[34;1;4m setup keys \033[0m"

export KEYS="/mnt/keys"
[[ ! -d "$KEYS" ]] && sudo mkdir -p "$KEYS"

toInstall=()
[[ ! $(pacman -Qn bitwarden) ]] && toInstall+=("bitwarden")
[[ ! $(pacman -Qn veracrypt) ]] && toInstall+=("veracrypt")
# shellcheck disable=SC2086
# shellcheck disable=SC2128
sudo pacman -Syu $toInstall --noconfirm

mountedDevices=$(veracrypt -t -l)
if [[  $mountedDevices =~ .*"$KEYS".* ]]; then
  logWarning "A directory was already mounted to $KEYS"
  echo "$mountedDevices"
else
  echo "Devices:"
  ls /dev/sd*
  read -p "Which device holds the encrypted volume? " -r device
  sudo veracrypt -t "$device" "$KEYS"
fi

[[ ! -L "$HOME/.gnupg" ]] && ln -s "$KEYS/.gnupg" "$HOME/.gnupg"
[[ ! -L "$HOME/.ssh" ]] && ln -s "$KEYS/.ssh"   "$HOME/.ssh"
