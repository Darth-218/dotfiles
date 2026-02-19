eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# if command -v tmux >/dev/null 2>&1; then
#   if tmux info &>/dev/null; then
#     if [ -z "$TMUX" ]; then
#       echo "attaching to tmux..."
#       tmux attach || tmux
#     else
#       echo "in tmux..."
#     fi
#   else
#     echo "starting tmux..."
#     tmux
#   fi
# fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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

alias nixswitch="sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#deathstar"

mkdircd() {
  mkdir -p "$1" && cd "$1" || return
}

fpdf() {
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
