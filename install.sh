#!/usr/bin/env bash
# Symlink all dotfiles into $HOME using stow.
# Run from the dotfiles directory: bash install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

packages=(editor git kitty shell tmux)

for pkg in "${packages[@]}"; do
  echo "Stowing $pkg..."
  stow --dir="$DOTFILES_DIR" --target="$HOME" "$pkg"
done

echo "Done."
