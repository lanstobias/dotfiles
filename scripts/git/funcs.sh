get_current_branch() {
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
if [[ $inside_git_repo ]]; then
   echo "$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
fi;
}

# Checkout git branch
gcb() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Checkout git branch (including remote branches), sorted by most recent commit
# limit 30 last branches.
gcbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ \
             --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | delta'"

# Stolen from https://github.com/joaqo
# (https://github.com/junegunn/fzf/issues/1175#issuecomment-403642951)
# Checkout git commit with previews
fcoc_preview() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# Git commit browser with previews
# Stolen from https://github.com/joaqo
# (https://github.com/junegunn/fzf/issues/1175#issuecomment-403642951)
glc() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

#gla() {
   #local inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
   #if [[ $inside_git_repo ]]; then
      #local current_branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
   #fi;

   #if [[ $# -eq 0 ]]; then
      #local other_branch="origin/master"
   #elif [[ $# -eq 1 ]]; then
      #local other_branch="$1"
   #fi

   #gl $current_branch $other_branch
#}
