#!/bin/bash

sudo pamac install nordvpn-bin --no-confirm
sudo usermod -aG nordvpn "$USER"
sudo systemctl enable nordvpnd --now

echo -e "\033[34;1;4m After next login use nordvpn login \033[0m"
