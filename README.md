# Bash Script for Setting Up Zsh with Oh-My-Zsh and Custom Plugins

This Bash script sets up a new environment for using the Zsh shell with Oh-My-Zsh and two custom plugins: zsh-autosuggestions and zsh-syntax-highlighting.

## Prerequisites

- This script assumes you are using a Unix-like operating system, such as Linux or macOS.
- Git and curl need to be installed. If they are not already installed, the script will attempt to install them.


## Instalation
1. Download the script or copy to a file you created.
2. Make the file executable.
```bash
chmod +x script-name.sh
```

3. Run the script with the following command:
```bash
./script-name.sh
```

## Usage
Once everything is installed make to run `script-name.sh` again for the custom plugins to be cloned and added to `~/.zshrc` after you done that source zshrc by running the following command:
```bash
source ~/.zshrc
```

## Custom Plugins
The script also includes the installation of two custom plugins, `zsh-autosuggestions` and `zsh-syntax-highlighting`.

If you'd like to add additional custom plugins, simply follow the format in the script by cloning the plugin repository to the `~/.oh-my-zsh/custom/plugins` directory and adding the plugin's in the plugins you can modify this section:
```bash
echo 'Adding plugins to .zshrc...'
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting ...)/' ~/.zshrc
```
