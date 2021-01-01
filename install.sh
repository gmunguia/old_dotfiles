#!/bin/bash

set -e

# TODO installation script for megasync and keeweb.

echo "installing git..."
sudo apt install -y git
ln -s "$(pwd)/gitconfig" ~/.gitconfig
ln -s "$(pwd)/gitignore" ~/.gitignore

echo "installing chrome, firefox..."
sudo apt install -y firefox
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

echo "installing fonts..."
sudo apt install -y fonts-firacode

echo "installing zsh, oh-my-zsh..."
sudo apt install -y zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
rm ~/.zshrc
ln -s "$(pwd)/zshrc" ~/.zshrc

echo "setting up default shell user"
echo "export DEFAULT_USER=$(whoami)" >> ~/.zshrc

echo "installing zsh plugins"
cd ~/.oh-my-zsh/custom/plugins
git clone --depth=1 https://github.com/zdharma/history-search-multi-word.git
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
git clone --depth=1 https://github.com/zdharma/fast-syntax-highlighting.git

echo "installing hyper terminal"
curl -sL https://releases.hyper.is/download/deb > hyper.deb
sudo apt install -yf ./hyper.deb
rm -f ~/.hyper.js
ln -s "$(pwd)/hyper.js" ~/.hyper.js

echo "installing starship"
curl -fsSL https://starship.rs/install.sh | bash
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

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

echo "installing neovim..."
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim python-dev python3-dev python-pip python3-pip
mkdir -p ~/.config/nvim
ln -s "$(pwd)/nvimrc" ~/.config/nvim/init.vim
ln -s "$(pwd)/coc-settings.json" ~/.config/nvim/coc-settings.json

echo "setting up neovim python dependencies"
# TODO move installation of these dependencies to init.vim
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

echo "installing keyboard remaps"
setxkbmap -option "ctrl:nocaps"
sudo apt install -y git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
git clone --depth=1 https://github.com/alols/xcape.git
echo "xcape -e 'Control_L=Escape'" >> ~/.zshrc
ln -s "$(pwd)/Xmodmap" ~/.Xmodmap

echo "installing yubikey utilities"
sudo apt-add-repository ppa:yubico/stable
sudo apt update
sudo apt install yubikey-manager

echo "Done!!"
