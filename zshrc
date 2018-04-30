

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

ZSH_AUTOSUGGEST_USE_ASYNC=true

# [[ -d ${HOME}/bin ]] && export PATH=$HOME/bin:$PATH

# Docker
alias docker="sudo docker"
alias d="docker"

# K8s
alias k="kubectl"

# rbenv
[[ -d ${HOME}/.rbenv/bin ]] && export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
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
