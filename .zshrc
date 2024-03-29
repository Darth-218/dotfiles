# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

CASE_SENSITIVE="false"

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

plugins=(git
  zsh-autosuggestions
  zsh-syntax-highlighting
  command-not-found)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# # Update PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/home/darth/go/bin

# Aliases
alias py="python3 -u"
alias birthdaemon="emacs --daemon"
alias killdaemon='emacsclient -e "(kill-emacs)"'
alias tmux="tmux -f ~/.dotfiles/tmux/tmux.conf"
alias p="sudo pacman"
alias nv="nvim"
alias capsesc="setxkbmap -option 'caps:swapescape'"
alias lg="lazygit"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

eval "$(zoxide init --cmd cd zsh)"

# Oh My Posh initialization
eval "$(oh-my-posh init zsh --config /home/darth/.dotfiles/oh-my-posh/ohmyposhtheme.omp.json)"


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/darth/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
