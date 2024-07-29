#!/bin/bash

sudo apt update
sudo apt install fish neovim eza batcat wezterm yazi ncdu

mkdir -p ~/.config/nvim ~/.config/fish ~/.config/nvim/ ~/.config/bat

echo '[1/4] Configuring fish...'
echo '      [1/2] Setting fish as default shell'
chsh -s /usr/bin/fish
echo '      [2/2] Adding fish configuration'
cp -R .config/fish  ~/.config/fish

echo '[2/4] Configuring batcat...'
cp -R .config/bat ~/.config/bat

echo '[3/4] Configuring neovim...'
cp -R .config/nvim ~/.config/nvim

echo '[4/4] Configuring wezterm...'
cp -R .config/wezterm ~/.config/wezterm
