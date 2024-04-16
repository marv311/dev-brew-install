#!/bin/bash
# Navigate to the home directory
cd ~

# Install Homebrew
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew installed successfully!"

# Install packages git node php mysql composer using Homebrew
echo "Installing Git, Node, PHP, MySQL, Composer"
brew install git node php mysql composer

# Set the correct path for PHP for default PHP version
echo 'export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"' >> ~/.zshrc
echo "PHP installed and version set to 8.3"

# Add the correct path for Composer
echo 'export PATH="/usr/local/opt/composer/bin:$PATH"' >> ~/.zshrc
exho "Composer installed and  path added to the shell profile"

# Add the correct paths for NODEJ to the shell profile .zshrc
echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
echo 'export LDFLAGS="-L/opt/homebrew/opt/node@20/lib" >> ~/.zshrc'
echo 'export CPPFLAGS="-I/opt/homebrew/opt/node@20/include" >> ~/.zshrc'
echo "NodeJS installed paths added to the shell profile"


# Install Vue Cli
echo "Installing Vue CLI"
npm install -g @vue/cli
echo "Vue CLI installed successfully!"

# Install Google Cloud SDK
echo "Installing Google Cloud SDK"
brew install --cask google-cloud-sdk
# Initialize Google Cloud SDK
gcloud init
echo "Google Cloud SDK installed successfully!"

# Install Google SQL Proxy
echo "Installing Google SQL Proxy"
curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.10.1/cloud-sql-proxy.darwin.arm64
chmod +x cloud_sql_proxy
mv cloud_sql_proxy ~/cloud_sql_proxy

echo "Google Cloud SQL Proxy installed successfully!"

# Install Nuxt3 and Yarn Globally
npm install -g nuxt yarn

echo "Yarn Installation completed successfully!"

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