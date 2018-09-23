ZSH=$HOME/.oh-my-zsh           # Path to your oh-my-zsh configuration.
ZSH_THEME="robbyrussell"       # Theme
COMPLETION_WAITING_DOTS="true" # Display red dots while waiting

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/usr/local/mongodb/bin

# Customize to your needs...
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}? "
ZSH_THEME_GIT_PROMPT_CLEAN=""


# ======================== Aliases ========================
# ===> Git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gpom='git push origin master'
alias gd='git diff'
alias gcm='git commit -m'
alias gcma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'
alias gitignore='cp ~/.gitignore .'

# ===> Directory information
alias lh='ls -d .*' # show hidden files/directories only
alias l='ls -al'
alias lsa='ls -a'
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl' # Same as above, but in long listing format
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias 'filecount=find . -type f | wc -l' # number of files (not directories)

# ===> Directory movement
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# ===> Safety
#alias rm='echo "rm is disabled, use remove or /bin/rm instead."'
#alias remove='/bin/rm -iv'
#alias removedir='/bin/rm -irv'

# ===> Python
alias py3='python3'
alias venvon=". venv/bin/activate"
alias venvoff="deactivate"

# ===> Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"

# ===> Remote machines
alias scotchbox='cd ~/scotchbox; vagrant up'
alias pi='ssh -p 2022 pi@tomat.trickip.net'

# ================== Bind Keys ====================
bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b


# ======================== Functions ========================
# ===> Return my IP address
function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
     ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# ===> Change directory to the current Finder directory
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# ===> Display well-formated path
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
