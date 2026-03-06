#!/usr/bin/env bash
set -e

echo "Setup start"

# -----------------------
# Update Homebrew
# -----------------------
echo "Updating Homebrew..."
brew update

# -----------------------
# Brew packages
# (Git)
# -----------------------
if ! command -v git >/dev/null 2>&1; then
  echo "Installing Git..."
  brew install git
else
  echo "Git already installed"
fi

# -----------------------
# Brave Browser
# -----------------------
if [ -d "/Applications/Brave Browser.app" ]; then
  echo "Brave already installed"
else
  echo "Installing Brave..."

  TMP_DIR=$(mktemp -d)
  curl -L "https://laptop-updates.brave.com/latest/osx" -o "$TMP_DIR/brave.dmg"

  hdiutil attach "$TMP_DIR/brave.dmg" -nobrowse
  cp -R "/Volumes/Brave Browser/Brave Browser.app" /Applications
  hdiutil detach "/Volumes/Brave Browser"

  rm -rf "$TMP_DIR"
fi

# -----------------------
# Docker Desktop
# -----------------------
if [ -d "/Applications/Docker.app" ]; then
  echo "Docker already installed"
else
  echo "Installing Docker..."

  TMP_DIR=$(mktemp -d)
  ARCH=$(uname -m)

  if [ "$ARCH" = "arm64" ]; then
    DOCKER_URL="https://desktop.docker.com/mac/main/arm64/Docker.dmg"
  else
    DOCKER_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg"
  fi

  curl -L "$DOCKER_URL" -o "$TMP_DIR/docker.dmg"

  hdiutil attach "$TMP_DIR/docker.dmg" -nobrowse
  cp -R "/Volumes/Docker/Docker.app" /Applications
  hdiutil detach "/Volumes/Docker"

  rm -rf "$TMP_DIR"
fi

# -----------------------
# Figma
# -----------------------
if [ -d "/Applications/Figma.app" ]; then
  echo "Figma already installed"
else
  echo "Installing Figma..."

  TMP_DIR=$(mktemp -d)
  curl -L "https://desktop.figma.com/mac/Figma.dmg" -o "$TMP_DIR/figma.dmg"

  hdiutil attach "$TMP_DIR/figma.dmg" -nobrowse
  cp -R "/Volumes/Figma/Figma.app" /Applications
  hdiutil detach "/Volumes/Figma"

  rm -rf "$TMP_DIR"
fi

# -----------------------
# Google Chrome
# -----------------------
if [ -d "/Applications/Google Chrome.app" ]; then
  echo "Google Chrome already installed"
else
  echo "Installing Google Chrome..."

  TMP_DIR=$(mktemp -d)
  curl -L "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg" -o "$TMP_DIR/chrome.dmg"

  hdiutil attach "$TMP_DIR/chrome.dmg" -nobrowse
  cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
  hdiutil detach "/Volumes/Google Chrome"

  rm -rf "$TMP_DIR"
fi

# -----------------------
# Google Japanese Input
# -----------------------
if [ -d "/Library/Input Methods/GoogleJapaneseInput.app" ]; then
  echo "Google Japanese Input already installed"
else
  echo "Installing Google Japanese Input..."

  TMP_DIR=$(mktemp -d)
  curl -L "https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg" -o "$TMP_DIR/google-ime.dmg"

  hdiutil attach "$TMP_DIR/google-ime.dmg" -nobrowse
  sudo installer -pkg "/Volumes/GoogleJapaneseInput/GoogleJapaneseInput.pkg" -target /
  hdiutil detach "/Volumes/GoogleJapaneseInput"

  rm -rf "$TMP_DIR"
fi

# -----------------------
# Slack
# -----------------------
if [ -d "/Applications/Slack.app" ]; then
  echo "Slack already installed"
else
  echo "Installing Slack..."

  TMP_DIR=$(mktemp -d)
  curl -L "https://slack.com/ssb/download-osx-universal" -o "$TMP_DIR/slack.dmg"

  hdiutil attach "$TMP_DIR/slack.dmg" -nobrowse
  cp -R "/Volumes/Slack/Slack.app" /Applications
  hdiutil detach "/Volumes/Slack"

  rm -rf "$TMP_DIR"
fi

# -----------------------
# Sourcetree
# -----------------------
if [ -d "/Applications/Sourcetree.app" ]; then
  echo "Sourcetree already installed"
else
  echo "Installing Sourcetree..."

  TMP_DIR=$(mktemp -d)
  curl -L "https://product-downloads.atlassian.com/software/sourcetree/ga/Sourcetree.dmg" -o "$TMP_DIR/sourcetree.dmg"

  hdiutil attach "$TMP_DIR/sourcetree.dmg" -nobrowse
  cp -R "/Volumes/Sourcetree/Sourcetree.app" /Applications
  hdiutil detach "/Volumes/Sourcetree"

  rm -rf "$TMP_DIR"
fi

# -----------------------
# Visual Studio Code
# -----------------------
if [ -d "/Applications/Visual Studio Code.app" ]; then
  echo "VSCode already installed"
else
  echo "Installing VSCode..."

  TMP_DIR=$(mktemp -d)
  curl -L "https://update.code.visualstudio.com/latest/darwin-universal/stable" -o "$TMP_DIR/vscode.zip"

  unzip -q "$TMP_DIR/vscode.zip" -d "$TMP_DIR"
  cp -R "$TMP_DIR/Visual Studio Code.app" /Applications

  rm -rf "$TMP_DIR"
fi