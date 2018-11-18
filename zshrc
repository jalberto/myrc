# zmodload zsh/zprof

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

# Local plugins
export ZSH_CACHE_DIR=${fpath[1]}
[[ -d ${HOME}/myrc/zsh ]] && source ${HOME}/myrc/zsh/*.plugin.zsh

# Misc
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# PW generator
xkp() {
  pw=`diceware`
  b64=`echo -n ${pw} | base64 -w0`
  echo "${b64}  ${pw}"
}

# Git
alias gitprune="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"

# Docker
alias docker="sudo docker"
alias d="docker"
alias doco="docker-compose"

# K8s
# alias k="kubectl"
alias kp="kube-prompt"
alias kt="kubetail"
alias kall="kubectl --all-namespaces"

# elixir
export ERL_AFLAGS="-kernel shell_history enabled"

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
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --smart-case --glob "!**/{.git,node_modules,vendor,priv,deps,_build}/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
source /usr/share/fzf/shell/key-bindings.zsh

# vim
export EDITOR=nvim
alias vi="nvim"
alias v="vi"

# tmux
alias t="tmux"

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# Mnemonic [V]ersion [M]anager [I]nstall
vmi() {
  local lang=${1}

  if [[ ! $lang ]]; then
    lang=$(asdf plugin-list | fzf)
  fi

  if [[ $lang ]]; then
    local versions=$(asdf list-all $lang | fzf -m)
    if [[ $versions ]]; then
      for version in $(echo $versions);
      do; asdf install $lang $version; done;
    fi
  fi
}
# Mnemonic [V]ersion [M]anager [C]lean
vmc() {
  local lang=${1}

  if [[ ! $lang ]]; then
    lang=$(asdf plugin-list | fzf)
  fi

  if [[ $lang ]]; then
    local versions=$(asdf list $lang | fzf -m)
    if [[ $versions ]]; then
      for version in $(echo $versions);
      do; asdf uninstall $lang $version; done;
    fi
  fi
}
# zprof
