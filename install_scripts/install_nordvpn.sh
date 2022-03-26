#!/bin/bash

sudo pamac install nordvpn-bin
sudo systemctl enable --now nordvpnd
sudo usermod -aG nordvpn "$USER"

echo -e "\033[34;1;4m After next login use nordvpn login \033[0m"
