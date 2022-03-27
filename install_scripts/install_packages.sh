#!/bin/bash

# add the gpg key for tor-browser
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
sudo pamac install \
  base-devel \
  jetbrains-toolbox code \
  google-chrome nordvpn-bin tor-browser qbittorrent filezilla \
  spotify lilypond frescobaldi youtube-dl \
  discord \
  --no-confirm

flatpak install flathub \
  io.github.mimbrero.WhatsAppDesktop \
  com.slack.Slack \
  -y
