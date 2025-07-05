#!/bin/bash

echo '[1/4] Installing required binaries...'
sudo pacman -Syu \
  stow \
  ghostty \
  fish \
  neovim \
  eza \
  bat \
  tmux \
  yazi \
  ncdu \
  fzf \
  ripgrep \
  npm \
  fd \
  nwg-look \
  waybar \
  mako \
  wh-clipboard \
  hyprpaper hypridle hyprlock hyprpolkitagent xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  github-cli \
  man \
  just \
  kalamine \
  uv \
  networkmanager

echo '[2/4] Backup-ing current configuration...'
mv ~/.config ~/.config.bak
echo '[3/4] Installing configurations using STOW...'
stow -v common
echo '[4/4] Setting fish as default shell'
chsh -s /usr/bin/fish
