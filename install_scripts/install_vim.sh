#!/bin/bash

sudo pamac install vim vim-youcompleteme-git --no-confirm

[[ ! -f "$HOME/.vim/autoload/plug.vim" ]] && curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

[[ ! -f "$HOME/.vim/colors/solarized.vim" ]] && curl -fLo "$HOME/.vim/colors/solarized.vim" --create-dirs \
  "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim"

python "$HOME/.vim/plugged/youcompleteme/install.py"

vim +PlugInstall +qall
