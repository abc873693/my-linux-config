#!/bin/sh -e
cd

sudo apt-get install -y locales

#language
sudo locale-gen en_US.UTF-8

#install What I need 
sudo apt install man
sudo apt-get update
sudo apt-get -y install  curl git tmux
sudo apt-get -y install  python-pip python-dev build-essential
sudo apt-get -y install  build-essential cmake
sudo apt-get -y install  python-dev python3-dev
sudo apt-get -y install software-properties-common
sudo apt -y install neovim 

git clone https://github.com/vn7n24fzkq/my-linux-config.git

#setbashrc
cat ~/my-linux-config/config/.mybashrc >> ~/.bashrc

#rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rust-src # for YouCompleteMe rust
rustup component add rls --toolchain stable-x86_64-unknown-linux-gnu
rustup component add rls rust-analysis rust-src

#java
sudo apt-get install openjdk-11-jre openjdk-11-jdk

#npm
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs npm

#tmux 
ln -s -f ~/my-linux-config/config/.tmux/.tmux.conf
ln -s -f ~/my-linux-config/config/.tmux/.tmux.conf.local

#zsh
sudo apt-get -y install zsh
sudo apt-get -y install powerline fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#vim
mkdir -p ~/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
ln -s -f ~/my-linux-config/config/.vimrc 
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --all

reset

#git
ln -s -f ~/my-linux-config/config/.gitconfig

#LS_COLORS
ln -s -f ~/my-linux-config/config/.dircolors
. $HOME/.bashrc
