#!/bin/bash
# Dotfiles setup script for macOS
# Installs neovim, tmux, and symlinks config files

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles from: $DOTFILES"

# --- Homebrew ---
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add brew to path for Apple Silicon
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed"
fi

# --- Install packages ---
echo "Installing packages..."
brew install neovim tmux ripgrep fd

# --- Create symlinks ---
create_symlink() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "  Backing up existing: $dest -> ${dest}.backup"
        mv "$dest" "${dest}.backup" 2>/dev/null || true
    fi

    ln -sf "$src" "$dest"
    echo "  Linked: $dest -> $src"
}

echo "Creating symlinks..."

# Neovim config
mkdir -p ~/.config
create_symlink "$DOTFILES/nvim" ~/.config/nvim

# Tmux
create_symlink "$DOTFILES/tmux.conf" ~/.tmux.conf

# Keep old vim around (optional)
create_symlink "$DOTFILES/vim" ~/.vim
create_symlink "$DOTFILES/vimrc" ~/.vimrc

# Other configs
create_symlink "$DOTFILES/ackrc" ~/.ackrc
create_symlink "$DOTFILES/scripts" ~/.scripts
create_symlink "$DOTFILES/gitconfig" ~/.gitconfig
create_symlink "$DOTFILES/gitignore" ~/.gitignore

# Bash (optional - uncomment if you want these managed)
# create_symlink "$DOTFILES/bashrc" ~/.bashrc
# create_symlink "$DOTFILES/bash_profile" ~/.bash_profile
# create_symlink "$DOTFILES/bash" ~/.bash

# --- Setup Neovim ---
echo "Setting up Neovim plugins (first launch will install them)..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || echo "  Run 'nvim' to complete plugin installation"

echo ""
echo "Done! Quick tips:"
echo "  - Run 'nvim' to open Neovim (plugins will auto-install on first launch)"
echo "  - Press Ctrl-p to open file finder (like your old CtrlP)"
echo "  - Press ,e to toggle file explorer"
echo "  - Press ,fg for live grep search"
echo "  - tmux prefix is Ctrl-] (same as before)"
echo ""
