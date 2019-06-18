#!/bin/bash

# Create a symbolic link in the home directory
create_symlink() {
    if [ -z "$1" ]; then
        echo 'Usage: create_symlink "path/to/file"'
    else
        if [ ! -z "$(ls -A $1)" ]; then
            # Bash string manipulation, equivalent to 'basename'
            # See: http://tldp.org/LDP/LG/issue18/bash.html
            FILE_NAME=${1##*/}
            # -s create symlink
            # -f if target file exists, first unlink to allow linking
            # -n do not follow if target file is a symlink
            ln -sfn "$(pwd)/$1" "$HOME/$FILE_NAME"
            # Print success message
            echo "symlink created: $HOME/$FILE_NAME -> $(pwd)/$1"
        fi
    fi
}

# GHC
create_symlink '.ghci'

# Git
create_symlink '.gitconfig'
create_symlink '.githelpers'

# Vim
create_symlink '.vimrc'

# ZSH
create_symlink '.zshrc'
