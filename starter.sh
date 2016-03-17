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

# RVM/ruby
echo "Installing Ruby..."
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Node/npm
if test ! $(which npm); then
	echo "Installing Node..."
	brew install node
fi

# Adjust PATH
echo "Adjusting PATH"
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

# Grunt
echo "Installing Grunt..."
npm install -g grunt-cli

# Bower
echo "Installing Bower..."
npm install -g bower

# Yeoman
echo "Installing Yeoman..."
npm install -g yo
npm install -g generator-webapp

# Sass
echo "Installing Sass..."
gem install sass

# Compass
echo "Installing compass..."
gem update --system
gem install compass

# Spinners
echo "Installing spinners and sass-css-importer..."
gem install spinners
gem install --pre sass-css-importer

# Quick install for apps
brew tap caskroom/cask
brew install brew-cask

apps=(
	spectacle
	slack
  	appcleaner
	firefox
	google-chrome
	google-drive
	spotify
	atom
	sublime-text3
	vlc
	quicklook-json
	qlcolorcode
	qlstephen
	virtualbox
	evernote
	deezer
	dropbox
	cyberduck
	skype
	blender
	balsamic
	macaw
	adobe-photoshop-cc
	google-drive
	omni-disk-sweeper
	mongodb
    vagrant
    vagrant-manager
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
sudo mkdir /var/www

echo "Done!"
