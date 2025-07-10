# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey -r '^T'

# append to the history file, don't overwrite it
setopt APPEND_HISTORY

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enable color support and human readable filesizes within ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -h --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi

# Set a few Bash compatability options
setopt BASH_REMATCH        # Make the =~ operator behave like in Bash, see `man zshoptions`
setopt REMATCH_PCRE        # Make [[ "val" =~ ^pattern$ ]] use PCRE instead of ERE
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
# >< KSH_ARRAYS can cause issues with some plugins, disable before loading problematic plugins then reenable
# setopt KSH_ARRAYS           # Make Arrays 0-indexed like Ken intended

export PATH="$PATH:/home/frazer/.local/bin:/usr/local/go/bin:/home/frazer/go/bin:/home/frazer/scripts"

# Evaluate various TUI tools
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"

eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(atuin init zsh --disable-up-arrow)"

eval "$(sheldon source)"

fastfetch
