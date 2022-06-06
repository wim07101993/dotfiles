#!/bin/bash

# add the gpg key for tor-browser
# gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --import -

pamac install \
  base-devel \
  android-studio code vim \
  jetbrains-toolbox \
  google-chrome tor-browser nordvpn-bin qbittorrent filezilla \
  spotify lilypond frescobaldi \
  gimp youtube-dl \
  --no-confirm
#  discord \


flatpak install flathub \
  io.github.mimbrero.WhatsAppDesktop \
  com.slack.Slack \
  -y
