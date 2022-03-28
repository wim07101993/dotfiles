#!/bin/bash

logWarning() {
  echo -e "\033[33;1;4m Warning: $1 \033[0m"
}

logInfo() {
  echo -e "\033[34;1;4m $1 \033[0m"
}

maybeAddLineToFile(){
  line=$1
  file=$2
  [[ -f "$file" ]] && grep -qxF "$line" "$file" || echo "$line" >> "$file"
}

sudo pamac update
sudo pamac upgrade
sudo pamac install git

git config --global user.email "van.laer.wim@gmail.com"
git config --global user.name "Wim Van Laer"

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

sudo cp -f "$DOTFILES/etc/pamac.conf" "/etc/pamac.conf"

source "$DOTFILES/shell_profile.sh"
source "$DOTFILES/shell_rc.sh"

logInfo "set up symlinks"
[[ ! -L "$HOME/.vimrc" ]] && ln -s "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"
[[ ! -L "$HOME/.ideavimrc" ]] && ln -s "$DOTFILES/vim/.vimrc" "$HOME/.ideavimrc"
maybeAddLineToFile "source $DOTFILES/shell_profile.sh" "$HOME/.bash_profile"
maybeAddLineToFile "source $DOTFILES/shell_rc.sh" "$HOME/.bashrc"
maybeAddLineToFile "source $DOTFILES/shell_profile.sh" "$HOME/.zshrc"
maybeAddLineToFile "source $DOTFILES/shell_rc.sh" "$HOME/.zshrc"

logInfo "installing keys"
source "$DOTFILES/bin/mountkeys.sh"
logInfo "installing vim"
source "$DOTFILES/install_scripts/install_vim.sh"
logInfo "installing vpn"
source "$DOTFILES/install_scripts/install_nordvpn.sh"
logInfo "installing sdks"
source "$DOTFILES/install_scripts/install_sdks.sh"
logInfo "installing other packages"
source "$DOTFILES/install_scripts/install_packages.sh"

logInfo "to install ides, use the jetbrains toolbox"
