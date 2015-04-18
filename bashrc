export CC=/usr/bin/gcc
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=gxGxFxdxbxDxDxBxBxExEx

export HISTCONTROL=erasedups
export HISTSIZE=100000
shopt -s histappend

export PYTHONSTARTUP=~/.pythonrc.py

## Local
[[ -s ${HOME}/.local.bash ]] && source ${HOME}/.local.bash

## Java Home
[[ -s ${HOME}/.java_home ]] && source ${HOME}/.java_home

## Python Home
[[ -s ${HOME}/.python_home ]] && source ${HOME}/.python_home

export SRCPATH=$HOME/src
export PATH=/usr/local/bin:$PATH

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
bold=$(tput bold)
reset=$(tput sgr0)

function git-dirty {
if [[ $(git status | tail -n 1) != "nothing to commit, working directory clean" ]]
then
    echo '★ '
fi
}

function git-unpushed {
local branch=$(git rev-parse --abbrev-ref HEAD)

if [[ $(git branch -v | grep $branch) == *'ahead'* ]]
then
  echo $(git branch -v | grep $branch | cut -d " " -f3-5)
fi
}

function set-terminal-title {
  local title=$(pwd)

  title=${title#$SRCPATH/}
  title=${title/${HOME}/\~}

  if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null ); then
    title="$title @ $branch $(git-dirty) $(git-unpushed)"
  fi
  echo -ne $title
}

function __git_ps1 {
   git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-tmux"
if [[ ! -z "$TMUX" ]]; then
  if [[ "$SSH_AUTH_SOCK" != "$SOCK" ]]; then
    export SSH_AUTH_SOCK="$SOCK"
  fi
else
  if [[ ! -z "$SSH_AUTH_SOCK" ]] && [[ "$SSH_AUTH_SOCK" != $(readlink "$SOCK") ]]; then
    rm -f /tmp/ssh-agent-$USER-tmux
    ln -sf $SSH_AUTH_SOCK $SOCK
  fi
fi

PATH=$JAVA_HOME/bin:$PYTHON_HOME/bin:$PATH
export PS1='\[$red\]$([ \j -gt 0 ] && echo [\j])❤  \[$blue\]$(set-terminal-title) \[$bold\]| \[$reset\]'
#export PS0='\[\033[0;31m\]$([ \j -gt 0 ] && echo [\j])\033[0m\][\h \[\033[0;36m\]\W\[\033[1;32m\] $(__git_ps1) \033[0m\]]\$ '
