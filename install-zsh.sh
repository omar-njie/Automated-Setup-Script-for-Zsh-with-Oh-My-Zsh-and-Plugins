#!/bin/bash

# Install packages if they are not already installed
install_package() {
  if ! [ -x "$(command -v $1)" ]; then
    if [ -f /etc/redhat-release ]; then
      sudo yum install -y $1
    elif [ -f /etc/lsb-release ]; then
      sudo apt install -y $1
    fi
  else
    echo "$1 is already installed."
  fi
}

# Install git
install_package git

# Install curl (not for Debian distros)
if [ ! -f /etc/debian_version ]; then
  install_package curl
fi

# Install zsh
install_package zsh

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  if [ -f /etc/debian_version ]; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
else
  echo 'oh-my-zsh is already installed.'
fi

# Install custom plugins
install_plugin() {
  if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/$1" ]; then
    git clone https://github.com/zsh-users/$1.git $HOME/.oh-my-zsh/custom/plugins/$1
  fi
}

install_plugin zsh-autosuggestions
install_plugin zsh-syntax-highlighting

# Add plugins and alias to .zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
echo 'alias c="clear"' >> ~/.zshrc

echo 'Restarting terminal...'
tset

