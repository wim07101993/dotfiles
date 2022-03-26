#!/bin/bash

logWarning() {
  echo -e "\033[33;1;4m Warning: $1 \033[0m"
}

logInfo() {
  echo -e "\033[34;1;4m $1 \033[0m"
}

export SOURCE="$HOME/source"
export REPOS="$SOURCE/repos"
export DOTFILES="$REPOS/dotfiles"

mkdir -p "$REPOS"

if [ ! -d "$DOTFILES" ]; then
  logInfo "cloning DOTFILES repo"
  git clone https://github.com/wim07101993/DOTFILES.git "$DOTFILES"
else
  (cd "$DOTFILES" && git pull)
fi

source "$DOTFILES/shell_profile.sh"
source "$DOTFILES/shell_rc.sh"

logInfo "set up symlinks"
[[ ! -L "$HOME/.vimrc" ]] && ln -s "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"
[[ ! -L "$HOME/.ideavimrc" ]] && ln -s "$DOTFILES/vim/.vimrc" "$HOME/.ideavimrc"

logInfo "installing keys"
source "$DOTFILES/install_scripts/setup_keys.sh"
logInfo "installing vim"
source "$DOTFILES/install_scripts/install_vim.sh"
logInfo "installing vpn"
source "$DOTFILES/install_scripts/install_nordvpn.sh"
logInfo "installing other packages"
source "$DOTFILES/install_scripts/install_packages.sh"

logInfo "to install ides, use the jetbrains toolbox"
