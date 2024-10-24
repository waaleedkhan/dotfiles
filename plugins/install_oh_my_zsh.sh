#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Step 1: Check if Zsh is installed
install_zsh() {
    if command_exists zsh; then
        echo "Zsh is already installed."
    else
        echo "Zsh is not installed. Installing Zsh..."
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt update && sudo apt install -y zsh
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            brew install zsh
        else
            echo "Unsupported operating system. Please install Zsh manually."
            exit 1
        fi
    fi
}

# Step 2: Install Oh My Zsh
install_oh_my_zsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh is already installed."
    else
        echo "Installing Oh My Zsh..."
        /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

# Step 3: Set Zsh as the default shell
set_default_shell_to_zsh() {
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "Setting Zsh as the default shell..."
        chsh -s $(which zsh)
        echo "Please log out and log back in to start using Zsh as your default shell."
    else
        echo "Zsh is already the default shell."
    fi
}

# Main installation process
echo "Starting Oh My Zsh installation..."

install_zsh
install_oh_my_zsh
set_default_shell_to_zsh

echo "Installation complete!"
