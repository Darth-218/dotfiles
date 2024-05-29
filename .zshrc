# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setting a default directory for zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Making sure Zinit exits
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

bindkey -e

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

# # Update PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin/flutter/bin
export PATH=$PATH:/home/darth/go/bin
export PATH=$PATH:/home/darth/suckless/eww/target/release/
export PATH=$PATH:/home/darth/.config/rofi/scripts
export PATH=$PATH:~/bin
export PATH=$PATH:~/ash/bin/
export PATH=$PATH:~/bin/.zig/zig

# Aliases
alias ls='ls --color'
alias p="sudo pacman"
alias gpp="g++"
alias py="python3 -u"
alias ls='eza -1 -l --icons=always --time=created --no-permissions --no-user --no-time'
alias cat='bat -n --theme ansi'
alias loc='plocate'
alias nv="nvim"
alias lg="lazygit"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias server="ssh fury@100.97.146.68"

# Some functions
mkdircd(){mkdir "$1" && cd "$1" ;}
f(){sesh connect $(sesh list | fzf) ;}
fixkeys(){setxkbmap -option 'caps:swapescape' ; setxkbmap -option 'ctrl:swap_lalt_lctl' ;}

eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

enable-fzf-tab
clear
