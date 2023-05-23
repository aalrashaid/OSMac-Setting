#!/bin/bash

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Git
echo "Installing Git..."
brew install git

# Install Node.js (using Node Version Manager)
echo "Installing Node.js..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install node

# Install MySQL
echo "Installing MySQL..."
brew install mysql

# Install PHP
echo "Installing PHP..."
brew install php

# Install Nginx
echo "Installing Nginx..."
brew install nginx

# Install Laravel
composer global require laravel/installer

# Install Valet
echo "Installing Valet..."
composer global require laravel/valet
valet install

# Install MongoDB
echo "Installing MongoDB..."
brew tap mongodb/brew
brew install mongodb-community

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
chsh -s /bin/zsh

echo "Setup complete!"
