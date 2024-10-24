#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew
install_homebrew() {
    echo "Installing Homebrew..."
    if command_exists brew; then
        echo "Homebrew is already installed."
    else
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
            echo "Unsupported operating system for Homebrew."
            exit 1
        fi
    fi
}

# Main installation process
echo "Starting Homebrew installation..."
install_homebrew
echo "Homebrew installation complete!"
