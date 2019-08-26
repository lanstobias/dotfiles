#!/bin/bash

# Configure GIT
printf "Configure git.. "
# --> Set global .gitignore file
ln -s ~/dotfiles/git/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile '~/.gitignore_global'
printf "done!\n"

# Create symlinks
printf "Create symlinks..\n"
sh ./install/create-symlinks.sh
printf "done!\n"