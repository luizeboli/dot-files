#!/bin/bash


create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(realpath "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find . -type f -name ".*" -maxdepth 1)

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename "$file")
        echo "Creating symlink to $name in home directory."
        rm -rf ~/"$name"
        ln -s "$script_dir/$name" ~/"$name"
    done
}

create_symlinks

echo "Setting up environment vars..."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

echo "Setting up the Spaceship theme..."
sudo apt-get install powerline fonts-powerline -y
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# echo "Installing zsh-autosuggestions..."
# git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# echo "Installing zsh-nvm..."
# git clone https://github.com/lukechilds/zsh-nvm $ZSH_CUSTOM/plugins/zsh-nvm

# echo "Installing zsh-syntax-highlighting..."
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting