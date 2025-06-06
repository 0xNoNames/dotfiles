#!/bin/bash

echo '[1/4] Installing required binaries...'
sudo apt update
sudo apt install -y fish neovim eza batcat tmux yazi ncdu stow ghostty
echo '[2/4] Backup-ing current configuration...'
mv ~/.config ~/.config.bak
echo '[3/4] Installing configurations using STOW...'
stow -v .
echo '[4/4] Setting fish as default shell'
chsh -s /usr/bin/fish
