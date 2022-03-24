#!/bin/bash

# -----------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------

logWarning() {
  echo -e "\033[33;1;4m Warning: $1 \033[0m"
}

logInfo() {
  echo -e "\033[34;1;4m $1 \033[0m"
}

# -----------------------------------------------------------------------------
# SET UP KEYS
# -----------------------------------------------------------------------------
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

# -----------------------------------------------------------------------------
# INSTALL PACKAGES
# -----------------------------------------------------------------------------

logInfo "installing packages from pamac"
# add the gpg key for tor-browser
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
sudo pamac install \
  base-devel \
  vim vim-youcompleteme-git jetbrains-toolbox code \
  google-chrome nordvpn-bin tor-browser qbittorrent filezilla \
  spotify lilypond frescobaldi youtube-dl \
  discord \
  --no-confirm

logInfo "installing packages from flatpak"
flatpak install flathub \
  io.github.mimbrero.WhatsAppDesktop \
  com.slack.Slack \
  -y

# -----------------------------------------------------------------------------
# SETUP ENV
# -----------------------------------------------------------------------------

export SOURCE="$HOME/source"
export REPOS="$SOURCE/repos"
export DOTFILES="$REPOS/dotfiles"

mkdir -p "$REPOS"

if [ ! -d "$DOTFILES" ]; then
  logInfo "cloning DOTFILES repo"
  git clone https://github.com/wim07101993/DOTFILES.git "$DOTFILES"
fi

logInfo "set up symlinks"
ln -s "$DOTFILES/vim/.vimrc"   "$HOME/.vimrc"
ln -s "$HOME/.vimrc"           "$HOME/.ideavimrc"

logInfo "set up vim"
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl -fLo "$HOME/.vim/colors/solarized.vim" --create-dirs \
  "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim"
vim +PlugInstall +qall

echo "set up nordvpn"
sudo systemctl enable --now nordvpnd
sudo usermod -aG nordvpn "$USER"

logInfo "to install ides, use the jetbrains toolbox"
logInfo "use the nordvpn login command before usage"
