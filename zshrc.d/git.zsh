autoload -Uz add-zsh-hook

function _git_branch {
  local name st color

  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi

  name="`git symbolic-ref --short HEAD 2>/dev/null`"
  if [[ -z $name ]]; then
    return
  fi

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=${fg[blue]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=${fg[yellow]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=${fg_bold[red]}
  else
    color=${fg[red]}
  fi

  echo " on git:%{$color%}$name%{$reset_color%}"
}

function _update_rprompt {
  RPROMPT="[%~`_git_branch`]"
}

add-zsh-hook precmd _update_rprompt
