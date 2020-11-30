source "${HOME}/scripts/git/funcs.sh"

# Configs
export GIT_PAGER='delta'

if [ "${VIMRUNTIME}" ]; then
   export RUNNING_NVIM=true
else
   export RUNNING_NVIM=false
fi

log='git log --graph --date="short" --pretty="format:%C(auto,yellow bold)%h %C(auto,blue nobold)%>(12,trunc)%cr %C(auto,white dim)%<(15,trunc)%aN %C(auto)%d %C(reset)%s"'

# Aliases
alias gs='git status -s'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gco='git checkout'
alias gla='${log} --all'
alias gl="${log} $(get_current_branch) origin/master"
alias glp='${log} -p'
alias gp='git pull'
alias gf='git fetch'
alias gd='git diff | delta'
alias gdt='git difftool'
alias gsu='git submodule update --init --recursive'
alias gb='git branch'
alias st='status'
source ~/pandora/forgit/forgit.plugin.sh

