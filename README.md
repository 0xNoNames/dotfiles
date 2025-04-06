# Dotfiles

This directory contains all of my dotfiles.

## Requirements

> Ensure you have the following installed on your system

```bash
sudo apt install -y fish neovim eza batcat ghostty yazi ncdu stow tmux
sudo pacman -S fish neovim eza bat ghostty yazi ncdu stow fd fzf television tmux
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
stow -v -S common desktop
```

## Fonts

- JetBrainsMonoNerd
- LigaSFMonoNerd

## Applications

- wallust
- ghostty
- fish
- tmux
- neovim
- batcat
- eza
- yazi
- ncdu
- age
- fzf
- fd
- nwg-look (setup gtk)
