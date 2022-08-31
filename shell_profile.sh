#!/bin/bash

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SOURCE="$HOME/source"
export REPOS="$SOURCE/repos"
export DOTFILES="$REPOS/dotfiles"

export PATH="$DOTFILES/bin:$REPOS/flutter/bin:$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"

export CHROME_EXECUTABLE="/opt/google/chrome/google-chrome"
export TERMINAL="alacritty"
