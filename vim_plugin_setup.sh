#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install necessary packages
sudo apt update
sudo apt install -y tmux build-essential cmake python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm curl

# Clone and setup Vim configuration
echo "Setting up Vim and tmux..."
# cd ~/Documents
# git clone https://github.com/HuanMinpopcorn/HEIR_ROS_Config.git
cp -rf ~/Documents/HEIR_ROS_Config/Vim_config_folder/.vim ~/
cp -rf ~/Documents/HEIR_ROS_Config/Vim_config_folder/.vimrc ~/

# Download and setup Vim color scheme
echo "Downloading Vim color scheme..."
git clone https://github.com/connorholyday/vim-snazzy
mv vim-snazzy/colors ~/.vim/colors
rm -rf vim-snazzy
vim +PluginInstall +qall

# Install Vundle and plugins
# echo "Installing Vim plugins..."
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim +PluginInstall +qall

# Setup YouCompleteMe
# echo "Compiling YouCompleteMe..."
# cd ~/.vim/plugged/YouCompleteMe
# python3 install.py --all