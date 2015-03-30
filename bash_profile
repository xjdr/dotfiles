export CC=/usr/bin/gcc
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=gxGxFxdxbxDxDxBxBxExEx

export HISTCONTROL=erasedups
export HISTSIZE=100000
shopt -s histappend

export PYTHONSTARTUP=~/.pythonrc.py

## extras
[[ -s ${HOME}/.local.bash ]] && source ${HOME}/.local.bash

export SRCPATH=$HOME/src

function set-terminal-title {
  local title=$(pwd)

  title=${title#$SRCPATH/}
  title=${title/${HOME}/\~}

  if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null ); then
    title="$title @ \033[1;32m$branch"
  fi
  echo -ne '\033[0;36m'$title'\033[0m'
}

function __git_ps1 {
   git rev-parse --abbrev-ref HEAD 2>/dev/null
}

export PS1='\[\033[0;31m\]$([ \j -gt 0 ] && echo [\j])\033[0m\]\033[0;31m❤  $(set-terminal-title) | '
#export PS1='\[\033[0;31m\]$([ \j -gt 0 ] && echo [\j])\033[0m\][\h \[\033[0;36m\]\W\[\033[1;32m\] $(__git_ps1) \033[0m\]]\$ '
