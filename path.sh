#!/bin/bash

echo 'export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/mysql/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/nginx/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/mongodb-community/bin:$PATH"' >> ~/.zshrc

echo "PATH configurations have been added to your ~/.zshrc file."
