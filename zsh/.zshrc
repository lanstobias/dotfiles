ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="refined"
ZSH_THEME=powerlevel10k/powerlevel10k
COMPLETION_WAITING_DOTS="true"
plugins=(
    git
    colored-man-pages
    copydir
    osx
)

source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export EDITOR="nvim"
export PATH="/usr/local/sbin:$PATH"


# Source files
filesToSource=(
    '/Users/tobiaslans/dotfiles/scripts/aliases.sh'
)

for file in $filesToSource; do
    if [ -e $file ]; then
        source $file
    else
        echo "404: $file not found." 
    fi
done


# ======================== Aliases ========================
# ===> Directory information
alias lh='ls -d .*' # show hidden files/directories only
alias l='ls -al'
alias lsa='ls -a'
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl' # Same as above, but in long listing format
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias 'filecount=find . -type f | wc -l' # number of files (not directories)

#====> Git
# Aliases that the zsh git plugin got wrong
alias gs='git status'

# ===> Directory movement
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# ===> Python
alias py3='python3'
alias venvon=". venv/bin/activate"
alias venvoff="deactivate"

# ===> Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"

# ===> Remote machines
alias pi='ssh -p 2022 pi@tomat.trickip.net'

# ===> Editors
alias vim='nvim'
alias vimdiff='nvim -d'

# ===> Spotify
alias sp='spotify play'
alias sst='spotify pause'
alias sn='spotify next'
alias sp='spotify previous'
alias ss='spotify status'
alias sts='spotify toggle shuffle'
alias svu='spotify vol up'
alias svd='spotify vol down'
alias svs='spotify vol show'


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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
