#!/bin/bash

echo '[1/6] Installing required binaries...'
sudo pacman -Syu \
  networkmanager \
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
  skim \
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
  network-manager-applet \
  vlc \
  gnome-disk-utility \
  gnome-calculator \
  gnome-text-editor \
  showtime \
  nautilus \
  nautilus-image-converter \
  baobab \
  decibels \
  evince \
  eog \
  ttf-jetbrains-mono-nerd \
  ttf-roboto \
  tela-circle-icon-theme-standard \
  pastel

# pacman -S noto-fonts-emoji or yay -S ttf-twemoji

echo '[2/6] Backup-ing current configuration...'
mv ~/.config ~/.config.bak
echo '[3/6] Installing configurations using STOW...'
stow -v common
echo '[4/6] Setting fish as default shell'
chsh -s /usr/bin/fish

echo '[5/6] Install yay and run the following commands'
echo 'yay -S ttf-roboto-serif wlogout nautilus-open-any-terminal vesktop'

echo '[6/6] Setup fonts and theme using nwg-look'
