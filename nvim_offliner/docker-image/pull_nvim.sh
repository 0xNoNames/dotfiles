#!/bin/bash

set -ex

git clone -n --depth=1 --filter=tree:0 https://github.com/0xnonames/dotfiles ~/.config/ &&
  cd ~/.config &&
  git sparse-checkout set --no-cone /common/nvim &&
  git checkout &&
  mv common/nvim nvim

nvim test.py

tar czpvf ~/output/nvim_offline.tar.gz ~/.local/share/nvim ~/.local/state/nvim ~/.config/nvim
