
# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
# sudo bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

echo ""
echo "################################################"
echo "Installing RVM (https://rvm.io)"
echo "################################################"
echo ""

curl -L https://get.rvm.io | bash -s stable --ruby

echo ""
echo "################################################"
echo "Installing Gems: Sass, Compass"
echo "################################################"
echo ""

gem install sass compass

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
echo "Installing Commonly used NPM dependencies"
echo "################################################"
echo ""

npm install -g gulp grunt-cli

echo ""
echo "################################################"
echo "Installing dotfiles. This will simplify adding directories to your PATH."
echo "This will also make sure RVM and NVM load correctly on any new session."
echo "################################################"
echo ""

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude "install_deps.sh" --exclude "README.md" -av . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile

echo ""
echo "------------------------------------------------"
echo "DONE. PLEASE CLOSE YOUR TERMINAL AND REOPEN."
echo "------------------------------------------------"
echo ""
