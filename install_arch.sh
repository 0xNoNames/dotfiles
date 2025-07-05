#!/bin/bash

echo '[1/6] Installing required binaries...'
sudo pacman -Syu \
  networkmanager \
  stow \
  ghostty \
  fish \
  nautilus \
  nautilus-image-converter \
  neovim \
  eza \
  bat \
  tmux \
  yazi \
  ncdu \
  fzf \
  ripgrep \
  unzip \
  7zip \
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
  pavucontrol \
  vlc \
  gnome-disk-utility \
  ttf-jetbrains-mono-nerd \
  ttf-roboto

echo '[2/6] Backup-ing current configuration...'
mv ~/.config ~/.config.bak
echo '[3/6] Installing configurations using STOW...'
stow -v common
echo '[4/6] Setting fish as default shell'
chsh -s /usr/bin/fish

echo '[5/6] Install yay and run the following commands'
echo 'yay -S ttf-roboto-serif wlogout nautilus-open-any-terminal vesktop'

echo '[6/6] Setup fonts and theme using nwg-look'
