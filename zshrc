

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

ZSH_AUTOSUGGEST_USE_ASYNC=true

[[ -d ${HOME}/bin ]] && export PATH=$HOME/bin:$PATH

# Docker
alias docker="sudo docker"
alias d="docker"

# K8s
alias k="kubectl"
