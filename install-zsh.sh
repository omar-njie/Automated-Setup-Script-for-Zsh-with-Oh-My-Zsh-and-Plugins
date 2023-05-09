#!/bin/bash

# Check if git is installed and install it if not
if ! [ -x "$(command -v git)" ]; then
  echo 'Git is not installed. Installing now...'
  if [ -f /etc/redhat-release ]; then
    sudo yum install git -y
  elif [ -f /etc/lsb-release ]; then
    sudo apt install git -y
  fi
else
  echo 'Git is already installed.'
fi

# Install zsh
echo 'Installing zsh...'
if [ -f /etc/redhat-release ]; then
  sudo yum install zsh -y
elif [ -f /etc/lsb-release ]; then
  sudo apt install zsh -y
fi

# Install oh-my-zsh if it's not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo 'Installing oh-my-zsh...'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo 'oh-my-zsh is already installed.'
fi

# Check if .zshrc file exists
if [ ! -f "$HOME/.zshrc" ]; then
  echo '.zshrc file not found. Creating it...'
  touch $HOME/.zshrc
fi

echo 'Adding plugins to .zshrc...'
plugins="plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
if grep -q "^$plugins$" "$HOME/.zshrc"; then
  echo 'Plugins already added to .zshrc.'
else
  echo $plugins >> $HOME/.zshrc
fi

echo 'Sourcing .zshrc...'
source ~/.zshrc
echo 'Restarting terminal...'
tset

