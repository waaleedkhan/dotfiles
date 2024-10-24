export PATH="/usr/local/bin:$PATH"
export EDITOR="code -w"

source ~/.zsh-plugins/init.zsh
source ~/.zsh-plugins/git.zsh
source ~/.zsh-plugins/bundler.zsh

alias zsh-reload=". ~/.zshrc"

setopt BANG_HIST
setopt EXTENDED_HISTORY 
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_BEEP

export HISTORY_IGNORE="ls:ls -al:la:ll:lla:&:[bf]g:exit:history:top:clear:cd:cd ..:cd .:start-zscalar:kill-zscalar"

# dumbledore
export ASDF_DUMBLEDORE_DEBUG=1
export DUMBLEDORE_USE_ASDF=true

