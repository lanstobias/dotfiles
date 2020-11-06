# Configs
export GIT_PAGER='delta'

if [ "${VIMRUNTIME}" ]; then
   export RUNNING_NVIM=true
else
   export RUNNING_NVIM=false
fi

# Aliases
source ~/scripts/git/funcs.sh
alias gs='git status -s'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gco='git checkout'
alias gl='git log --graph --date="short" --pretty="format:%C(auto,yellow bold)%h %C(auto,blue nobold)%>(12,trunc)%cr %C(auto,white dim)%<(14,trunc)%aN %C(reset)%s%C(auto)%d"'
alias gla='gl --all'
alias glp='gl -p'
alias gp='git pull'
alias gf='git fetch'
alias gd='git diff | delta'
alias gdt='git difftool'
alias gsu='git submodule update --init --recursive'
alias gb='git branch'
alias st='status'
source ~/pandora/forgit/forgit.plugin.sh

