eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"


if tmux info &> /dev/null; then 
  if ! [ -n "$TMUX" ]; then
    tmux attach;
    echo "attaching to tmux...";
  else
    echo "in tmux..."
  fi
else
  tmux;
  echo "starting tmux..."
fi


# Setting a default directory for zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Making sure Zinit exits
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode


# History
HISTSIZE=2500
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase


setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups


# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


export SUDO_EDITOR=/usr/bin/nvim

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/home/darth/go/bin
export PATH=$PATH:~/go/bin


alias p="sudo pacman"

alias gpp="g++"
alias py="python3 -u"

alias cat='bat -n --theme ansi'
alias loc='plocate'

alias nv="nvim"
alias nf="nvim (fzf)"

alias lg="lazygit"

alias gs="git status -s"

alias ga="git add"
alias gap="git add --patch"

alias gc="git commit"
alias gcm="git commit -m"

alias gp="git pull"
alias gf="git fetch"
alias gu="git push"

alias ls='ls --color'
alias internet="watch -n 0.5 lsof -i"

alias k="sudo systemctl restart kmonad"
alias wdk="sudo systemctl restart wdkmonad"

alias pdf="zathura"

alias windowss="hyprshot -m window"
alias monitorss="hyprshot -m monitor"
alias regionss="hyprshot -m region"

mkdircd() { mkdir "$1" && cd "$1" ; }


[ -f ~/.fzf.zsh ]&& source ~/.fzf.zsh

enable-fzf-tab

eval "$(oh-my-posh init zsh --config ~/.ohmyposhtheme.omp.json)"

# bun completions
[ -s "/home/darth/.local/share/reflex/bun/_bun" ] && source "/home/darth/.local/share/reflex/bun/_bun"

# bun
export BUN_INSTALL="$HOME/.local/share/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
