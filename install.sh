#!/bin/bash
set -e

echo "==> Installing Neovim..."
if ! command -v nvim &>/dev/null; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo tar -xzf nvim-linux64.tar.gz -C /opt
  sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
  rm nvim-linux64.tar.gz
fi

echo "==> Installing dependencies..."
# ripgrep (for telescope grep)
if ! command -v rg &>/dev/null; then
  sudo apt-get update && sudo apt-get install -y ripgrep fd-find
fi

echo "==> Linking config..."
mkdir -p ~/.config
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

echo "==> Done! Run 'nvim' to start."
