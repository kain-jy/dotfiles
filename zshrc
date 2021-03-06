# kain <me@kain-jy.com>

# general
autoload -U compinit
compinit -u
setopt autopushd
setopt pushd_ignore_dups
setopt auto_cd
setopt list_packed
setopt list_types
setopt nonomatch
setopt nobeep

# prompt
autoload -U colors
colors
setopt transient_rprompt
setopt prompt_subst
PROMPT_INFO="%{${fg_bold[yellow]}%}%n@%m%{$reset_color%}"
PROMPT_MARK="%(!.#.$)"
PROMPT="$PROMPT_INFO
$PROMPT_MARK "
RPROMPT="[%~]"

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
setopt extended_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# environment variables
export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=xterm-256color

# alias
alias ls="ls --color"
alias ll="ls -al"
alias tmux="tmux -2"
alias top="TERM=screen htop"

# load additional settings
for file in $HOME/.zsh.d/**/*.zsh; do
  if [ -r "$file" ]; then
    source $file
  fi
done
