#!/bin/bash

# enable repos
sudo dnf copr enable dejan/lazygit

programs=(
    "curl"
    "git"
    "gh" # github cli for auth
    "stow"
    "trash-cli"
    "zsh"
    "kitty"
    "tmux"
    "neovim"
    "python3-neovim"
    "tldr"
    "fd-find"
    "ripgrep"
    "fzf"
    "lazygit"
)

sudo dnf install -y "${programs[@]}"


# install starship shell prompt
curl -sS https://starship.rs/install.sh | sh

