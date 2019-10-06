#!/bin/bash

set -e

echo "installing git..."
sudo apt install -y git
ln -s "$(pwd)/gitconfig" ~/.gitconfig
ln -s "$(pwd)/gitignore" ~/.gitignore

echo "installing chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

echo "installing keepass..."
sudo add-apt-repository ppa:eugenesan/ppa
sudo apt update
sudo apt install -y keepass2

echo "installing zsh, oh-my-zsh..."
sudo apt install -y zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
rm ~/.zshrc
ln -s "$(pwd)/zshrc" ~/.zshrc

echo "setting up default shell user"
echo "export DEFAULT_USER=$(whoami)" >> ~/.zshrc

echo "installing nvm..."
sudo apt install -y curl
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

echo "setting up node, npm..."
nvm install --lts

echo "installing yarn..."
npm i -g yarn
npm i -g yarn-completions

echo "installing fonts..."
git clone https://github.com/powerline/fonts --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code

echo "installing neovim..."
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim python-dev python3-dev python-pip python3-pip
mkdir -p ~/.config/nvim
ln -s "$(pwd)/nvimrc" ~/.config/nvim/init.vim

echo "setting up neovim python dependencies"
# TODO: move installation of these dependencies to init.vim
pip install setuptools
pip install wheel
pip install neovim
pip3 install setuptools
pip3 install wheel
pip3 install neovim

echo "setting up neovim plugin manager"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
mkdir ~/vim-dein
sudo chown -R $(whoami) ~/vim-dein
sh ./installer.sh ~/vim-dein
rm ./installer.sh

echo "installing ag..."
# used also for fzf command in neovim
sudo apt install -y silversearcher-ag

echo "Done!!"
