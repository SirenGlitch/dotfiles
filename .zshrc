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

# append to the history file, don't overwrite it
setopt APPEND_HISTORY

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support and human readable filesizes within ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -h --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi

[ -r /home/frazer/.config/byobu/prompt ] && . /home/frazer/.config/byobu/prompt   #byobu-prompt#

# Set a few Bash compatability options
setopt BASH_REMATCH        # Make the =~ operator behave like in Bash, see `man zshoptions`
setopt REMATCH_PCRE        # Make [[ "val" =~ ^pattern$ ]] use PCRE instead of ERE
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
# >< KSH_ARRAYS can cause issues with some plugins, disable before loading problematic plugins then reenable
# setopt KSH_ARRAYS           # Make Arrays 0-indexed like Ken intended

export PATH="$PATH:/home/frazer/.local/bin:/home/frazer/.local/share/bob/nvim-bin:/home/frazer/.nimble/bin"
eval "$(thefuck --alias)"

# make the nerdfont available to the chromebook terminal
(cd ~/nerdfont; nohup python3 server.py > /dev/null 2> /dev/null & )

# Evaluate various TUI tools
eval "$(starship init zsh)"

eval "$(starship completions zsh)"

eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(atuin init zsh --disable-up-arrow)"

eval "$(sheldon source)"

# Autostart tmux if not already in a session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi
