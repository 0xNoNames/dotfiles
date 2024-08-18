# Dotfiles

This directory contains all of my dotfiles.

## Requirements

> Ensure you have the following installed on your system

```bash
sudo apt install -y fish neovim eza batcat wezterm yazi ncdu stow
# JetBrainsMono Nerd Font
```

## Installation

> First, check out the dotfiles repo in your `$HOME` directory using git

```bash
git clone git@github.com/0xNoNames/dotfiles.git
cd dotfiles
```

### Automatic install

> Use the installation script

```bash
./install.sh
```

### Manual install

> Install requirements and then use GNU stow to create symlinks

```bash
mv ~/.config ~/.config.bak
stow -v -t ~/ -S aerospace bat fish nvim wezterm
```

## Fonts

- JetBrainsMonoNerd
- LigaSFMonoNerd

## Applications

- wezterm
- fish
- neovim
- batcat
- eza
- yazi
- ncdu
- age
- fzf
- fd
