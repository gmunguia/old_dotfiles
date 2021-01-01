brew tap homebrew/cask-fonts
brew cask install font-fira-code

brew cask install megasync
echo "configure mega to sync all to ~/sync/"

brew cask install iterm2
echo "set iterm2 preferences->general->preferences->load settings from ~/sync/iterm/"

brew install zsh

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
brew cask install slack
brew cask install vlc
brew cask install qbittorrent
brew cask install rambox
brew cask install visual-studio-code
brew cask install wireshark
brew cask install macs-fan-control
echo "open macs-fan-control to accept security alert"


