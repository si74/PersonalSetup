# Ask for administrator password upfront
sudo -v

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Fix any brew conflicts, although shouldn't be needed with a new install
brew doctor

# Update homebrew recipes
brew update

# golang
if test ! $(which go); then
  echo "Installing golang"
  brew install go
fi

# installing pip and virtualenv for python development
if test ! $(which python3); then
  echo "Installing python3"
  brew install python3
fi

if test ! $(which pip); then
  echo "Installing pip"
  brew install pip
fi

if test ! $(which virtualenv); then
  echo "Installing virtualenv"
  pip install virtualenv
fi

#create directory in which to store virtual environments
echo "Creating python virtual environments..."
mkdir ~/.virtualenvs
virtualenv -p python py2 #this should be python2
virtualenv -p python3 py3

# Node/npm
# if test ! $(which npm); then
# 	echo "Installing Node..."
# 	brew install node
# fi

# Adjust PATH
# echo "Adjusting PATH"
# export NODE_PATH="/usr/local/lib/node"
# export PATH="/usr/local/share/npm/bin:$PATH"

# Grunt
# echo "Installing Grunt..."
# npm install -g grunt-cli
#
# Bower
# echo "Installing Bower..."
# npm install -g bower
#
# Yeoman
# echo "Installing Yeoman..."
# npm install -g yo
# npm install -g generator-webapp
#
# Sass
# echo "Installing Sass..."
# gem install sass
#
# Compass
# echo "Installing compass..."
# gem update --system
# gem install compass
#
# Spinners
# echo "Installing spinners and sass-css-importer..."
# gem install spinners
# gem install --pre sass-css-importer

# Quick install for apps
brew tap caskroom/cask
brew install brew-cask

apps=(
	#spectacle
	slack
  #appcleaner
	firefox
	google-chrome
	google-drive
	spotify
	atom
	#vlc
	#quicklook-json
	#qlcolorcode
	#qlstephen
	virtualbox
	evernote
	#dropbox
	#cyberduck
	skype
	#blender
	#balsamic
	#macaw
	#adobe-photoshop-cc
	google-drive
	omni-disk-sweeper
	#mongodb
  vagrant
  vagrant-manager
  iterm2
  docker
  docker-machine
	#dash
  #doctl
  terraform
  cleanmymac3
  todoist
  tomatoone
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "Apps installed are symlinked to /Applications"
echo "Actual files are in /opt/homebrew-cask/Caskroom/"

echo "Making text selectable in quick view"
defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder

# Create /Sites/ directory
echo "Creating /Sites/"
sudo mkdir ~/Sites/

# Create gocode directory for development
echo "Creating gocode subfolder"
cd ~/Sites
sudo mkdir gocode

echo "Done!"
