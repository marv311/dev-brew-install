#!/bin/bash

# Navigate to the home directory
cd ~

# Install Homebrew
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew installed successfully!"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Reload the shell profile
source ~/.zshrc

# Prompt user for services to install
echo "Which services would you like to install?"
echo "1. Git"
echo "2. Node 20"
echo "3. PHP 8.3"
echo "4. MySQL"
echo "5. Composer"
echo "6. Vue CLI"
echo "7. Google Cloud SDK"
echo "8. Google SQL Proxy"
echo "9. Nuxt3 and Yarn"
echo "10. Setup SSH keys for git"

read -p "Enter the numbers of the services you want to install (comma-separated): " services

# Install selected services using Homebrew
for service in $(echo $services | tr ',' ' '); do
    case $service in
        1)
            echo "Installing Git"
            brew install git
            ;;
        2)
            echo "Installing Node"
            brew install node@20
            ;;
        3)
            echo "Installing PHP"
            brew install php@8.3
            ;;
        4)
            echo "Installing MySQL"
            brew install mysql@8.3
            ;;
        5)
            echo "Installing Composer"
            brew install composer
            ;;
        6)
            echo "Installing Vue CLI"
            npm install -g @vue/cli
            ;;
        7)
            echo "Installing Google Cloud SDK"
            brew install --cask google-cloud-sdk
            ;;
        8)
            echo "Installing Google SQL Proxy"
            curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.10.1/cloud-sql-proxy.darwin.arm64
            chmod +x cloud_sql_proxy
            mv cloud_sql_proxy ~/cloud_sql_proxy
            ;;
        9)
            echo "Installing Nuxt3 and Yarn"
            npm install -g nuxt yarn
            ;;
        10)
            echo "Creating SSH keys for Bitbucket"
            ssh-keygen -t rsa -b 4096 -C
            eval "$(ssh-agent -s)"
            ssh-add -K ~/.ssh/id_rsa
            pbcopy < ~/.ssh/id_rsa.pub
            echo "SSH key copied to clipboard. Add it to your Bitbucket account."
            ;;
        *)
            echo "Invalid service number: $service"
            ;;
    esac
done