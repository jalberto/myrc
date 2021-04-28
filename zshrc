#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

ZSH_AUTOSUGGEST_USE_ASYNC=true

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

###################################################################################
setopt NO_CASE_GLOB

# [[ -d ${HOME}/bin ]] && export PATH=$HOME/bin:$PATH
# [[ -d ${HOME}/.fzf/bin ]] && export PATH=$HOME/.fzf/bin:$PATH
[[ -d ${HOME}/.local/bin ]] && export PATH=$HOME/.local/bin:$PATH
[[ -d ${HOME}/.cargo/bin ]] && export PATH=$HOME/.cargo/bin:$PATH

# QT
export QT_STYLE_OVERRIDE=adwaita-dark
export QT_QPA_PLATFORM=wayland

# Go
export GOPATH="$HOME/.go"
[[ -d ${HOME}/.go/bin ]] && export PATH=$HOME/.go/bin:$PATH

# Misc
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# PW generator
xkp() {
  pw=`diceware`
  b64=`echo -n ${pw} | base64 -w0`
  echo "${b64}  ${pw}"
}

# Git
alias Gitprune="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"

# Docker
alias docker="sudo docker"
alias d="docker"
alias doco="sudo docker-compose"

# K8s
alias k="kubectl"
alias kall="kubectl --all-namespaces"

# elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# ruby
bu() {
  if [ -f $PWD/bin/bundle ]; then
    bin/bundle $@
  else
    bundle $@
  fi
}

ra() {
  export ELASTIC_APM_ACTIVE=false
  if [ -f $PWD/bin/rails ]; then
    bin/rails $@
  else
    bundle ex rails $@
  fi
}

# dnf
alias dnf="sudo dnf"
alias dnfi="dnf install"
alias dnfi="dnf install"
alias dnfU="dnf update && flatpak update"
alias dnfs="dnf search"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_fzf_compgen_path() {
  fda --hidden --follow --exclude "**/{.git,node_modules,vendor,deps,_build,tmp}/*" . "$1"
}
_fzf_compgen_dir() {
  fdb --type d --hidden --follow --exclude "**/{.git,node_modules,vendor,deps,_build,tmp}/*" . "$1"
}

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude "**/{.git,node_modules,vendor,deps,_build,tmp}/*"'
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --smart-case --glob "!**/{.git,node_modules,vendor,deps,_build,tmp}/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

# vim
export EDITOR=nvim
alias vi="nvim"
alias v="vi"

# tmux
alias t="tmux"
alias tl="tmux-layout-load"
alias tw="tmux list-windows -F '#{window_active} #{window_layout}' | grep '^1' | cut -d ' ' -f 2"

tmux-layout-load() {
  if [ -f $PWD/.tmux.yaml ]; then
    teamocil --here --layout $PWD/.tmux.yaml
  fi
}

# asdf
source $HOME/.asdf/asdf.sh
# source $HOME/.asdf/completions/asdf.bash

KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac --without-odbc"

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

source /home/ja/.config/broot/launcher/bash/br
