#!/bin/bash

echo '[1/4] Installing required binaries...'
sudo pacman -Syu ish neovim eza bat tmux yazi ncdu stow ghostty
echo '[2/4] Backup-ing current configuration...'
mv ~/.config ~/.config.bak
echo '[3/4] Installing configurations using STOW...'
stow -v common
echo '[4/4] Setting fish as default shell'
chsh -s /usr/bin/fish
