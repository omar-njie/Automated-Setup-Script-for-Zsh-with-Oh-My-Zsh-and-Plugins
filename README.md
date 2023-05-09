# Setting Up Zsh with Oh-My-Zsh and Custom Plugins using Bash Script

This Bash script automates the setup of the Zsh shell with Oh-My-Zsh and two custom plugins, zsh-autosuggestions, and zsh-syntax-highlighting, making it easier for you to get started with your Unix-like operating system, such as Linux or macOS.

## Prerequisites

Before running the script, ensure that you have the following:

- A Unix-like operating system, such as Linux or macOS.
- Git and curl are installed. If they are not installed, the script will attempt to install them.


## Instalation

To get started with the installation, follow the simple steps below:

1. Download the script or copy it to a file you created.
2. Make the file executable by running the following command:
```bash
chmod +x script-name.sh
```

3. Run the script with the following command:
```bash
./script-name.sh
```

## Usage
Once you've executed the script, run it again to clone and add the custom plugins to `~/.zshrc`.


To source `~/.zshrc`, use the following command:
```bash
source ~/.zshrc
```

## Custom Plugins
The script also includes the installation of two custom plugins, `zsh-autosuggestions` and `zsh-syntax-highlighting`.

If you would like to add more custom plugins, follow the format used in the script by cloning the plugin repository to the `~/.oh-my-zsh/custom/plugins` directory. The script will automatically add the plugin to the plugins list in `~/.zshrc`.

To modify the list of plugins in `~/.zshrc`, modify the code in this section down below:

```bash
echo 'Adding plugins to .zshrc...'
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting ...)/' ~/.zshrc
```
