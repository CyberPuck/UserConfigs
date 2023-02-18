#!/bin/bash

# Install Git, VIM
# Need to pull from ppa repo to get latest release
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt-get --yes install git vim 

# Get user input data

read -p "Please enter your email: " email
read -p "Please enter your name: " user_name

# Run SSH key-gen

ssh-keygen -t ed25519 -C $email

# Run GPG generate

gpg --full-generate-key

# Get the GPG key id for signing commits

gpg_key_id=$(eval gpg --list-signatures --with-colons | grep 'sig:' | grep "$user_name" | head -n 1 | cut -d':' -f5)

# Setup Git profile
git config --global user.name "$user_name"
git config --global user.email $email
git config --global user.signingkey $gpg_key_id
git config --global commit.gpgsign true
git config --global core.editor "vim"
