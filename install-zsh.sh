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

# Install oh-my-zsh
echo 'Installing oh-my-zsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##################################################
##   	   CUSTOM PLUGINS BEGIN HERE	  ##
##################################################

# zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

##################################################
##   	   CUSTOM PLUGINS END HERE		##
##################################################

echo 'Adding plugins to .zshrc...'
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo 'Sourcing .zshrc...'
source ~/.zshrc
echo 'Resetting terminal...'
reset

