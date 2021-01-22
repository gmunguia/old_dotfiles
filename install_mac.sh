#!/bin/bash

brew tap homebrew/cask-fonts
brew cask install font-fira-code

brew cask install megasync
echo "configure mega to sync all to ~/sync/"

#brew cask install iterm2
#echo "set iterm2 preferences->general->preferences->load settings from ~/sync/iterm/"

brew cask install karabiner-elements
# Have karabiner use the config file in the repo.
cp -f ~/repos/dotfiles/karabiner/karabiner.json ~/.config/karabiner
rm -rf ~/repos/dotfiles/karabiner
mv ~/.config/karabiner ~/repos/dotfiles/karabiner
ln -s ~/repos/dotfiles/karabiner ~/.config
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server
echo "check manual to get karabiner working https://pqrs.org/osx/karabiner/document.html"

brew cask install keeweb
brew cask install shortcuts
brew cask install aws-vault
brew cask install gimp
brew cask install google-chrome
brew cask install libreoffice
brew cask install vlc
brew cask install qbittorrent
brew cask install visual-studio-code
brew cask install wireshark
brew cask install macs-fan-control
echo "open macs-fan-control to accept security alert"

echo "installing hyper, zsh, etc."
brew install zsh
brew install hyper
rm -f ~/.hyper.js
ln -s "$(pwd)/hyper.js" ~/.hyper.js
# TODO replace zsh path in hyper config.

cd ~/.oh-my-zsh/custom/plugins
git clone --depth=1 https://github.com/zdharma/history-search-multi-word.git
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
git clone --depth=1 https://github.com/zdharma/fast-syntax-highlighting.git

brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

echo "setting up default shell user"
echo "export DEFAULT_USER=$(whoami)" >> ~/.zshrc

echo "adding mac-specific aliases"
echo 'alias copy="pbcopy"' >> ~/.zshrc
echo 'alias paste="pbpaste"' >> ~/.zshrc
