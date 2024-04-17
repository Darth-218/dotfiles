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

LS_COLORS=$LS_COLORS:'di=31:' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'ow=0;35:' ; export LS_COLORS

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

bindkey '^ ' autosuggest-accept

# # Update PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/home/darth/go/bin
export PATH=$PATH:/home/darth/suckless/eww/target/release/

# Aliases
alias p="sudo pacman"
alias gpp="g++"
alias py="python3 -u"
alias capsesc="setxkbmap -option 'caps:swapescape'"
alias ctrlalt="setxkbmap -option 'ctrl:swap_lalt_lctl'"
alias mux="tmux -f ~/.dotfiles/tmux/tmux.conf"
alias nv="nvim"
alias lg="lazygit"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias uni="cd college-stuff"
alias minecraft="sudo java -jar /home/darth/the-duat/Personal/Setup\ files/Tlauncher/TLauncher-2.899.jar"

alias server="ssh fury@100.97.146.68"

eval "$(zoxide init --cmd cd zsh)"

# Oh My Posh initialization
eval "$(oh-my-posh init zsh --config /home/darth/.dotfiles/oh-my-posh/ohmyposhtheme.omp.json)"

# Tmux startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/darth/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
