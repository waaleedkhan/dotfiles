#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Step 1: Install Homebrew if not installed
install_homebrew() {
    if command_exists brew; then
        echo "Homebrew is already installed."
    else
        echo "Homebrew is not installed. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

# Step 2: Install asdf using Homebrew
install_asdf() {
    if command_exists asdf; then
        echo "asdf is already installed."
    else
        echo "Installing asdf using Homebrew..."
        brew install asdf
    fi
}

# Step 3: Add asdf to Zsh configuration
configure_asdf_for_zsh() {
    if grep -q 'asdf.sh' ~/.zshrc; then
        echo "asdf is already configured in ~/.zshrc."
    else
        echo "Configuring asdf in ~/.zshrc..."
        echo -e '\n# Add asdf to shell' >> ~/.zshrc
        echo -e '. $(brew --prefix asdf)/libexec/asdf.sh' >> ~/.zshrc
    fi

    if grep -q 'asdf completions' ~/.zshrc; then
        echo "asdf completions are already configured in ~/.zshrc."
    else
        echo "Configuring asdf completions in ~/.zshrc..."
        echo -e '\nautoload -U compinit; compinit' >> ~/.zshrc
        echo -e 'fpath=($(brew --prefix asdf)/completions $fpath)' >> ~/.zshrc
    fi

    # Apply the changes to the current shell session
    source ~/.zshrc
}

# Main installation process
echo "Starting installation of asdf with Homebrew and Zsh configuration..."

install_homebrew
install_asdf
configure_asdf_for_zsh

echo "Installation complete! Please restart your terminal or run 'source ~/.zshrc' to apply changes."
