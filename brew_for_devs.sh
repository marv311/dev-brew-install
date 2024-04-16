#!/bin/bash

# Navigate to the home directory
cd ~

# Prompt user for services to install
echo "Which services would you like to install?"
echo "0. Homebrew"
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
        0)
            echo "Installing Homebrew"
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            echo "Homebrew installed successfully!"
            echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc
            source ~/.zshrc
            ;;
        1)
            echo "Installing Git"
            brew install git
            echo "Git installed successfully!"
            ;;
        2)
            echo "Installing Node"
            brew install node@20
            echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
            echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
            echo 'export LDFLAGS="-L/opt/homebrew/opt/node@20/lib"' >> ~/.zshrc
            echo 'export CPPFLAGS="-I/opt/homebrew/opt/node@20/include"' >> ~/.zshrc
            echo "Node installed successfully!"
            ;;
        3)
            echo "Installing PHP"
            brew install php@8.3
            echo "PHP installed successfully!"
            ;;
        4)
            echo "Installing MySQL"
            echo 'export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"' >> ~/.zshrc
            echo 'export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"' >> ~/.zshrc
            brew install mysql@8.3
            ;;
        5)
            echo "Installing Composer"
            echo 'export PATH="/usr/local/opt/composer/bin:$PATH"' >> ~/.zshrc
            brew install composer
            echo "Composer installed successfully!"
            ;;
        6)
            echo "Installing Vue CLI"
            npm install -g @vue/cli
            echo "Vue CLI installed successfully!"
            ;;
        7)
            echo "Installing Google Cloud SDK"
            brew install --cask google-cloud-sdk
            echo "Google Cloud SDK installed successfully!"
            echo "Make sure to authenticate with gcloud auth login"
            gcloud auth login
            ;;
        8)
            echo "Installing Google SQL Proxy"
            gcloud components install cloud_sql_proxy
            echo "Make sure to authenticate with gcloud auth application-default login"
            echo "Then run the proxy with cloud_sql_proxy -instances=<INSTANCE_CONNECTION_NAME>=tcp:3306"
            ;;
        9)
            echo "Installing Nuxt3 and Yarn"
            npm install -g nuxt yarn
            echo "Nuxt3 and Yarn installed successfully!"
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

# Reload the shell profile
source ~/.zshrc
