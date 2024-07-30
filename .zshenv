. "$HOME/.cargo/env"
  export GPG_TTY=$(tty)
  fpath=($HOME/zsh_completions/ $HOME/.local/share/sheldon/repos/github.com/zsh-users/zsh-completions $fpath)
  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --tmux"
  export FZF_CTRL_T_OPTS=" \
    --walker-skip .git,node_modules,target \
    --preview 'bat -n --color=always {}' \
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"
  export FZF_ALT_C_OPTS=" \
    --walker-skip .git,node_modules,target \
    --preview 'tree -C {}'" 
  . "$HOME/.atuin/bin/env"
  source "$HOME/fzf-git.sh/fzf-git.sh"
