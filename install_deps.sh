echo ""
echo "################################################"
echo "Installing Homebrew (http://brew.sh/)"
echo "################################################"
echo ""

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ""
echo "################################################"
echo "Installing RVM (https://rvm.io)"
echo "################################################"
echo ""

curl -L https://get.rvm.io | bash -s stable --ruby

echo ""
echo "################################################"
echo "Installing NVM (https://github.com/creationix/nvm)"
echo "################################################"
echo ""

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

# init nvm
source ~/.nvm/nvm.sh

echo ""
echo "################################################"
echo "Installing Latest Version Of Node"
echo "################################################"
echo ""

nvm install node
nvm alias default node

echo ""
echo "################################################"
echo "Installing Brew Packages"
echo "################################################"
echo ""

brew install yarn httpie

echo ""
echo "################################################"
echo "Installing Composer"
echo "################################################"
echo ""

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo ""
echo "################################################"
echo "Installing git-friendly"
echo "################################################"
echo ""

curl -L https://raw.github.com/jamiew/git-friendly/master/install.sh | bash

function installPhpMySql() {
  echo ""
  echo "################################################"
  echo "Installing PHP 7.1/MySQL"
  echo "################################################"
  echo ""

  brew install "homebrew/php/php71" mysql
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installPhpMySql
else
  read -p "Would you like to install PHP 7.1 and MySQL? (y/n)" -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    installPhpMySql
  fi
fi

function installLaravel() {
  echo ""
  echo "################################################"
  echo "Installing Laravel"
  echo "################################################"
  echo ""
  composer global require "laravel/installer" "laravel/valet"
  valet install
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installLaravel
else
  read -p "Would you like to install Laravel? (y/n)" -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    installLaravel
  fi
fi

# echo ""
# echo "################################################"
# echo "Installing dotfiles. This will simplify adding directories to your PATH."
# echo "This will also make sure RVM and NVM load correctly on any new session."
# echo "################################################"
# echo ""
#
# function doIt() {
# 	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude "install_deps.sh" --exclude "README.md" -av . ~
# }
#
# if [ "$1" == "--force" -o "$1" == "-f" ]; then
# 	doIt
# else
# 	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
# 	echo
# 	if [[ $REPLY =~ ^[Yy]$ ]]; then
# 		doIt
# 	fi
# fi
# unset doIt
# source ~/.bash_profile

#echo ""
#echo "################################################"
#echo "Installing Laravel Valet"
#echo "################################################"
#echo ""

#valet install

echo ""
echo "------------------------------------------------"
echo "DONE."
echo "------------------------------------------------"
echo ""
