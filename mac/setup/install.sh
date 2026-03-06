#!/bin/bash

set -e

echo "Installing Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew path detect (Apple Silicon or Intel)
if [[ -d /opt/homebrew ]]; then
  BREW_PREFIX="/opt/homebrew"
else
  BREW_PREFIX="/usr/local"
fi

# PATHにbrewが無ければ追加
case ":$PATH:" in
  *":$BREW_PREFIX/bin:"*) ;;
  *) export PATH="$BREW_PREFIX/bin:$PATH" ;;
esac

brew update

echo "Downloading Brewfile..."
curl -fsSL https://raw.githubusercontent.com/norfinnshima/setup/main/mac/setup/Brewfile -o Brewfile

echo "Installing packages..."
brew bundle

echo "Setup complete"