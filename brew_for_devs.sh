#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages git node php mysql composer using Homebrew
brew install git node php mysql composer

# Set the correct path for PHP for default PHP version
echo 'export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"' >> ~/.zshrc
echo "PHP version set to 8.3"

# Add the correct path for Composer
echo 'export PATH="/usr/local/opt/composer/bin:$PATH"' >> ~/.zshrc
exho "Composer path added to the shell profile"

# Add the correct paths for NODEJ to the shell profile .zshrc
echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
echo 'export LDFLAGS="-L/opt/homebrew/opt/node@20/lib" >> ~/.zshrc'
echo 'export CPPFLAGS="-I/opt/homebrew/opt/node@20/include" >> ~/.zshrc'
echo "NodeJS paths added to the shell profile"


# Install Nuxt and Vue using npm
npm install -g create-nuxt-app
npm install -g @vue/cli

# Install Google Cloud SDK
brew install --cask google-cloud-sdk

# Install Google SQL Proxy
curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
chmod +x cloud_sql_proxy
mv cloud_sql_proxy ~/cloud_sql_proxy

# Install Nuxt3 and Yarn Globally
npm install -g nuxt yarn

echo "Installation completed successfully!"

# Create SSH keys for bitbucket
ssh-keygen -t rsa -b 4096 -C

# Add the SSH key to the ssh-agent
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

# Copy the SSH key to the clipboard
pbcopy < ~/.ssh/id_rsa.pub

echo "SSH key copied to clipboard. Add it to your Bitbucket account."

# Remind User to Run Mysql Secure Installation and start the mysql service
echo "Run 'mysql_secure_installation' to secure your mysql installation"
echo "Start the mysql service using 'brew services start mysql'"