#!/bin/bash

# Check if Git is installed
if ! command -v git &> /dev/null
then
    # Install Git based on the Linux distribution
    if [ -f /etc/redhat-release ]; then
        sudo yum install git -y
    elif [ -f /etc/lsb-release ]; then
        sudo apt-get update
        sudo apt-get install git -y
    fi
fi

if ! command -v zsh &> /dev/null
then
    # Install Zsh based on the Linux distribution
    if [ -f /etc/redhat-release ]; then
        sudo yum install zsh -y
    elif [ -f /etc/lsb-release ]; then
        sudo apt-get update
        sudo apt-get install zsh -y
    fi
fi

if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

