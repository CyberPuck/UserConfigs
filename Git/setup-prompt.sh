#!/bin/bash

# Install Curl

sudo apt-get --yes install curl 

# Simple script for coping git-prompt to local folder.
CONFIG_DIR="$HOME/.config/git"
if [ ! -d  "$CONFIG_DIR" ]; then
	mkdir -p "$CONFIG_DIR"
fi
# Check for Linux and try and apply for correct config
OS_STRING=$(uname)
if [ "$OS_STRING" = "Linux" ]; then
	echo "Applying Linux config"
	cp git-prompt.linux.sh "$HOME/.config/git/git-prompt.sh"
	echo "Applying settings to ~/.bashrc"
	echo "\n#git prompt:\nsource ~/.config/git/git-prompt.sh" >> "$HOME/.bashrc"
else
	echo "Applying Windows config"
	cp git-prompt.windows.sh "$HOME/.config/git/git-prompt.sh"
fi
