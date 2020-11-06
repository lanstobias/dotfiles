#!/bin/bash

readonly dotfiles_dir="${HOME}/dotfiles"

. ${dotfiles_dir}/setup/functions.sh

declare -a dotfiles=("test1" "test2")

backup_old_dotfiles() {
   fancy_echo "Backup current dotfiles.."
   readonly local today=`date +%Y%m%d`
   readonly local backup_dir="${HOME}/dotfiles_backup_${today}"

   if [[ ! -d "${backup_dir}" ]] ; then
      mkdir "${backup_dir}"
   fi

   if [[ -d "${HOME}/testdotfiles" ]] ; then
      mv ${HOME}/dotfiles
   else
      for dotfile in ${dotfiles[@]} ; do
         [[ -e ${HOME}/${dotfile} ]] && \
            mv ${HOME}/${dotfile} ${backup_dir}/${dotfile}.bak.${today}
      done
   fi

}

symlink_new_dotfiles() {
   for dotfile in ${dotfiles[@]} ; do
      if [ "${dotfile}" == "nvim" ]; then
         fancy_echo "nvim"
      fi
   done
}

backup_old_dotfiles
symlink_new_dotfiles

