#!/bin/bash

info="\033[34;1;4m"
warning="\033[33;1;4m"
question="\033[32;1;1m"
nc="\033[0m"

export KEYS="/mnt/keys"
[[ ! -d "$KEYS" ]] && sudo mkdir -p "$KEYS"

pamac install veracrypt bitwarden --no-confirm
mountedDevices=$(veracrypt -t -l)
if [[  $mountedDevices =~ .*"$KEYS".* ]]; then
  echo -e "$warning Warning: A directory was already mounted to $KEYS $nc"
  echo "$mountedDevices"
else
  echo -e "$question Devices:$nc"
  ls /dev/sd*
  echo -e "$question"
  read -p "Which device holds the encrypted volume? " -r device
  echo -e "$nc"
  sudo veracrypt -t "$device" "$KEYS"
fi

gpgdir="$HOME/.gnupg"
[[ ! -L "$gpgdir" ]] && ln -s "$KEYS/.gnupg" "$gpgdir"

unitFiles="$HOME/.config/systemd/user/"

mkdir -p "$unitFiles"
ssh_unitfile="$unitFiles/ssh-agent.service"
if [[ ! -L "$ssh_unitfile" ]]; then
  echo -e "$info creating ssh-agent.service $nc"
  ln -s "$DOTFILES/systemd/ssh-agent.service" "$ssh_unitfile"
  systemctl enable ssh-agent.service --now --user
fi

ssh-add "$KEYS/.ssh/github"
