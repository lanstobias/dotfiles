#!/bin/bash

target_dir=$HOME/dotfiles
backup_dir=$HOME/dotfiles_backup
files_to_link="vimrc vim git"

echo "Creating $backup_dir directory for backup of existing dotfiles.. "
mkdir $backup_dir
mkdir $target_dir

echo "Generate symlink to files.."
for file in $files_to_link; do
	if [ ! -e "$HOME/$file" ]; then
		continue
	fi

	if [ -f "$HOME/$file" ]; then
		echo "- $file: "

		mv $HOME/$file $backup_dir
		echo "* backed up"

		ln -sf $backup_dir/$file $target_dir
		echo "* symlink created"
	elif [ -d "$HOME/$file" ]; then
		echo "- $file: "

		mv -rf $HOME/$file $backup_dir
		echo "* backed up"

		ln -sf $backup_dir/$file $target_dir
		echo "* symlink created"
	fi
	printf "\n"
done
