#!/bin/bash

# add the gpg key for tor-browser
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
sudo pamac install \
  base-devel \
  android-studio code vim \
  jetbrains-toolbox \
  google-chrome nordvpn-bin qbittorrent filezilla \
  spotify lilypond frescobaldi \
  gimp youtube-dl
  --no-confirm
#  discord \
#  tor-browser

flatpak install flathub \
  io.github.mimbrero.WhatsAppDesktop \
  com.slack.Slack \
  -y
