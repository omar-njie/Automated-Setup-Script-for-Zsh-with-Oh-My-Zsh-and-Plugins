#!/bin/zsh

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
if ! [ -x "$(command -v zsh)" ]; then
  echo 'Zsh is not installed. Installing now...'
  if [ -f /etc/redhat-release ]; then
    sudo yum install zsh -y
  elif [ -f /etc/lsb-release ]; then
    sudo apt install zsh -y
  fi
else
  echo 'Zsh is already installed.'
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo 'Installing oh-my-zsh...'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo 'oh-my-zsh is already installed.'
fi

##################################################
##   	   CUSTOM PLUGINS BEGIN HERE	        ##
##################################################

# zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo 'Installing zsh-autosuggestions...'
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
    echo 'zsh-autosuggestions is already installed.'
fi

# zsh-syntax-highlighting
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo 'Installing zsh-syntax-highlighting...'
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
    echo 'zsh-syntax-highlighting is already installed.'
fi

##################################################
##   	   CUSTOM PLUGINS END HERE		##
##################################################

echo 'Adding plugins to .zshrc...'
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo 'Sourcing .zshrc...'
source ~/.zshrc
echo 'Restarting terminal...'
tset

