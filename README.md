### Easy bash script for installing tech stack for creating Laravel microservices with Nuxt user interfaces.


### Get Started

To user the scrip you will need to make the script executable running the following command

`chmod +x brew_for_devs.sh`

To run the script in your terminal
`./brew_for_devs.sh`

### What does this install?

    - Node 20
    - Vue Cli 
    - Php 8.3
    - Mysql 8.3
    - Composer
    - Google Cloud SQL
    - Google Cloud SDK 

The script starts by navigating to the home directory using `cd ~`. 

Next, it installs Homebrew, a package manager for macOS, by downloading the installation script from the Homebrew GitHub repository and executing it. After the installation, it adds Homebrew to the shell environment and reloads the shell profile.

The script then uses Homebrew to install several packages: Git, Node.js, PHP, MySQL, and Composer. It specifies versions for Node.js, PHP, and MySQL. 

### Decide what packages you need

Select the packages you want to install using commas to seperate the package numbers `1,2,3`

After the installations, the script adds the paths of the installed packages to the shell profile. This is done so that the shell can find these programs. For example, it adds the path to the PHP binary to the PATH environment variable, which allows the shell to find the PHP executable.

The script then installs the Vue CLI, Google Cloud SDK, and Google SQL Proxy. The Vue CLI is installed globally using npm, the Node.js package manager. The Google Cloud SDK and Google SQL Proxy are installed using Homebrew and curl respectively.

Next, the script installs Nuxt.js and Yarn globally using npm. Nuxt.js is a framework for building Vue.js applications, and Yarn is a package manager for JavaScript.

### Final Steps

The script then generates a new SSH key pair for Github or Bitbucket, adds the SSH key to the ssh-agent, and copies the public key to the clipboard. This is done to allow secure communication with Github or Bitbucket. 

Login to your Git hosting provider to add the key.

Finally, run the following commands

`mysql_secure_installation` to secure the MySQL installation 

`brew services start mysql` to start the MySQL service using .