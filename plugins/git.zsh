# This is based on https://github.com/ohmyzsh/ohmyzsh

# ALIASES

alias gs=' git status'
alias gf=' git fetch'
alias gp=' git pull'
alias gg=' gf && gp && gs'

alias gc=' git commit -S -m'

alias gl=' git log --oneline --decorate --graph'

alias grb=' git rebase'
alias grc=' git rebase --continue'
alias gra=' git rebase --abort'
alias grbi='git rebase --interactive'

alias dev=' git checkout develop'
alias master=' git checkout master'
alias main=' git checkout main'

alias gu=' git fetch upstream'
alias ghr=' git reset --hard'
alias gfu=' gu && master && gg && git merge upstream/master && gs'
alias gdp= ' dev && gg'

alias ga=' git add'
alias gaa=' git add --all'

alias gco=' git checkout'

alias gd=' git diff'
alias gdh=' git diff HEAD'
alias gdca=' git diff --cached'
alias gds=' git diff --staged'


alias grst=' git restore --staged'

alias gsh=' git show'

alias gstl=' git stash list'
alias gsta=' git stash push'
alias gstp=' git stash pop'

alias gsw=' git switch'
alias gswc=' git switch --create'

gfix() {
  git commit --fixup $1 && git rebase -i --autosquash $1^
}

gPR() {
    gh pr create -B develop -b "$1"
}

# FUNCTIONS

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(git --no-optional-locks symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(git --no-optional-locks rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Pass the prefix and suffix as first and second argument
# Example: git_prompt_info [ ]
function git_prompt_info() {
  # If we are on a folder not tracked by git, get out.
  if !git --no-optional-locks rev-parse --git-dir &> /dev/null; then
    return 0
  fi

  local ref
  ref=$(git --no-optional-locks symbolic-ref --short HEAD 2> /dev/null) \
  || ref=$(git --no-optional-locks describe --tags --exact-match HEAD 2> /dev/null) \
  || ref=$(git --no-optional-locks rev-parse --short HEAD 2> /dev/null) \
  || return 0

  echo "$1${ref:gs/%/%%}$(git_dirty_info "*")$2"
}

# Checks if working tree is dirty
# The argument passed in is printed when dirty
# Example: git_dirty_info "*"
function git_dirty_info() {
  local STATUS
  STATUS=$(git --no-optional-locks status --porcelain 2> /dev/null | tail -n 1)
  if [[ -n $STATUS ]]; then
    echo $1
  fi
}
