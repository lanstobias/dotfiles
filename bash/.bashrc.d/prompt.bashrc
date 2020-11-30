source "${HOME}/scripts/git/funcs.sh"

# Set variable identifying the chroot you work in (not used)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[00;34m\]"
BRIGHT_BLUE="\[\033[01;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[00;32m\]"
BRIGHT_GREEN="\[\033[01;32m\]"
RED="\[\033[0;31m\]"
VIOLET="\[\033[01;35m\]"
WHITE="\[\033[00m\]"

function parse_git_dirty() {
   local -n git_branch_color=$1
   local -n git_dirty_ch=$2

   STATUS="$(git status --ignore-submodule=all 2>/dev/null)"
   git_dirty_ch+=" ";

   if [[ $? -ne 0 ]]; then
      git_dirty_ch+="-";
   fi
   if echo ${STATUS} | grep -c "renamed" &> /dev/null; then
      git_dirty_ch+=">";
      git_branch_color="$CYAN"
   fi
   if echo ${STATUS} | grep -c "new file" &> /dev/null; then
      git_dirty_ch+="+";
      git_branch_color="$BRIGHT_GREEN"
   fi
   if echo ${STATUS} | grep -c "Untracked" &> /dev/null; then
      git_dirty_ch+="?";
      git_branch_color="$CYAN"
   fi
   if echo ${STATUS} | grep -c "modified" &> /dev/null; then
      git_dirty_ch+="*";
      git_branch_color="$YELLOW"
   fi
   if echo ${STATUS} | grep -c "deleted" &> /dev/null; then
      git_dirty_ch+="-";
      git_branch_color="$YELLOW"
   fi
   if echo ${STATUS} | grep -c "ahead" &> /dev/null; then
      git_dirty_ch+="⇡";
      git_branch_color="$VIOLET"
   fi
   if echo ${STATUS} | grep -c "behind" &> /dev/null; then
      git_dirty_ch+="⇣";
      git_branch_color="$RED"
   fi
}

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   PROMPT_DIRTRIM=10
   export GIT_PS1_SHOWDIRTYSTATE=true

   function color_my_prompt() {
      local __user_and_host="$BRIGHT_GREEN┌ "
      __user_and_host+="$BRIGHT_GREEN\u@\h"

      local __cur_location="$BRIGHT_BLUE\w"
      local __git_branch_color="$LIGHT_GRAY"
      local git_dirty_char="";
      parse_git_dirty __git_branch_color git_dirty_char

      local __git_branch="$(get_current_branch)";
      local __git_status="$git_dirty_char";
      local __prompt_angle="$BRIGHT_GREEN└"


      local __prompt_tail="$VIOLET$"
      local __last_color="$WHITE"
      export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__git_status\n$__prompt_angle $__prompt_tail$__last_color "
   }
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt
