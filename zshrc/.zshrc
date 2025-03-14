RPROMPT="%F{#9e86c8}%*%f"
PS1="%F{#a8c373}%(4~|.../%2~|%~)%f%(?.%F{#73bbb2}:%f.%F{#c47463}:%f) "

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

# # Update PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/bin/flutter/bin
export PATH=$PATH:/home/darth/go/bin
export PATH=$PATH:/home/darth/suckless/eww/target/release/
export PATH=$PATH:/home/darth/.config/rofi/scripts
export PATH=$PATH:~/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/ash/bin/
export PATH=$PATH:~/bin/.zig/zig
export PATH=$PATH:/home/darth/.dotnet/tools

# Aliases
alias ls='ls --color'
alias p="sudo pacman"
alias gpp="g++"
alias py="python3 -u"
alias cat='bat -n --theme ansi'
alias loc='plocate'
alias nv="nvim"
alias lg="lazygit"
alias internet="watch -n 0.5 lsof -i"
alias pyvenv="source ~/venv/bin/activate"
alias vnc="x11vnc -display :0 -auth guess -forever -loop -noxdamage -repeat -rfbauth ~/.vnc/passwd -rfbport 5900 -shared"

# Some functions
f() { sesh connect "$(sesh list | fzf-tmux -p 55%,60%)"; }
mkdircd() { mkdir "$1" && cd "$1" ; }
fixkeys() {
  setxkbmap -option "caps:swapescape";
  setxkbmap -option "ctrl:swap_lalt_lctl";
}

[ -f ~/.fzf.zsh ]&& source ~/.fzf.zsh

enable-fzf-tab
