

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

ZSH_AUTOSUGGEST_USE_ASYNC=true

# [[ -d ${HOME}/bin ]] && export PATH=$HOME/bin:$PATH
[[ -d ${HOME}/.local/bin ]] && export PATH=$HOME/.local/bin:$PATH
[[ -d ${HOME}/.cargo/bin ]] && export PATH=$HOME/.cargo/bin:$PATH

# Go
export GOPATH="$HOME/.go"
[[ -d ${HOME}/.go/bin ]] && export PATH=$HOME/.go/bin:$PATH

# 10 second wait if you do something that will delete everything
setopt RM_STAR_WAIT
# Case insensitive globbing
setopt NO_CASE_GLOB

# Docker
alias docker="sudo docker"
alias d="docker"
alias doco="docker-compose"

# K8s
alias k="kubectl"

# ruby
bu() {
  if [ -f $PWD/bin/bundle ]; then
    bin/bundle
  else
    bundle
  fi
}

ra() {
  if [ -f $PWD/bin/rails ]; then
    bin/rails
  else
    bundle ex rails
  fi
}

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# dnf
alias dnf="sudo dnf"
alias dnfi="dnf install"
alias dnfi="dnf install"
alias dnfU="dnf update"
alias dnfs="dnf search"

# fzf
source /usr/share/fzf/shell/key-bindings.zsh

# vim
export EDITOR=nvim
alias vi="nvim"
alias v="vi"

# tmux
alias by="byobu"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
