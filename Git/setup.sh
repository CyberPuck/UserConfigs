#!/bin/bash
# Simple script for coping git-prompt to local folder.
CONFIG_DIR="./config/git"
if [ ! -d  "$CONFIG_DIR" ]; then
	mkdir -p "$CONFIG_DIR"
fi
cp git-prompt.sh ~/.config/git/git-prompt.sh
