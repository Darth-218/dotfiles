eval "$(zoxide init bash)"
eval "$(fzf --bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

bind 'set completion-ignore-case on'
shopt -s nocaseglob

__update_ps1() {
  local env_name='\h'
  local color='01;32m'
  if [ -n "$IN_NIX_SHELL" ] || [ -n "$NIX_BUILD_TOP" ]; then
    env_name="${name:-nix}"
    color='01;35m'
  elif [ -n "$VIRTUAL_ENV" ]; then
    env_name=$(basename "$VIRTUAL_ENV")
    color='01;35m'
  elif [ -n "$CONDA_DEFAULT_ENV" ]; then
    env_name="$CONDA_DEFAULT_ENV"
    color='01;35m'
  fi

  PS1="\n[\[\033[${color}\]\u@${env_name}\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]]$ "
}

PROMPT_COMMAND=__update_ps1

HISTSIZE=2500
HISTFILE=~/.bash_history
HISTFILESIZE=$HISTSIZE

shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups

export SUDO_EDITOR=/usr/bin/nvim

export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/home/darth/go/bin"
export PATH="$PATH:$HOME/go/bin"

alias gpp="g++"
alias py="python3 -u"

alias nv="nvim"

alias lg="lazygit"

alias gs="git status -s"
alias ga="git add"
alias gap="git add --patch"

alias gc="git commit"
alias gcm="git commit -m"

alias gp="git pull"
alias gf="git fetch"
alias gu="git push"

alias ls='ls --color=auto'
alias internet="watch -n 0.5 lsof -i"

alias k="sudo systemctl restart kmonad"
alias wdk="sudo systemctl restart wdkmonad"

alias hotspot="sudo create_ap wlp4s0 enp3s0"

alias nsw="sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#deathstar"
alias nswp="sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#deathstar --print-build-logs"
alias nsh="nix-shell"
alias ncg="nix-collect-garbage --delete-older-than"

alias xv6="podman exec -it xv6-debian bash -c 'cd /xv6-container/xv6 && exec bash'"

mkdircd() {
  mkdir -p "$1" && cd "$1" || return
}

pdf() {
  local file

  if [ $# -eq 0 ]; then
    file=$(find . -type f -name "*.pdf" 2>/dev/null | fzf)
    [ -z "$file" ] && return
  else
    file="$1"
  fi

  zathura "$file" &>/dev/null &
  disown
}
