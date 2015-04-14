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
    echo $yellow'★ '
fi
}

function git-unpushed {
local branch=$(git rev-parse --abbrev-ref HEAD)

if [[ $(git branch -v | grep $branch) == *'ahead'* ]]
then
  echo '$red'$(git branch -v | grep $branch | cut -d " " -f3-5)
fi
}

function set-terminal-title {
  local title=$(pwd)

  title=${title#$SRCPATH/}
  title=${title/${HOME}/\~}

  if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null ); then
    title="$title @ \033[1;32m$branch $(git-dirty) $(git-unpushed)"
  fi
  echo -ne $blue$title
}

function __git_ps1 {
   git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-tmux"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-tmux
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

export PS1='\[$red\]$([ \j -gt 0 ] && echo [\j])$reset\]$red❤  $(set-terminal-title) $bold|$reset '
#export PS1='\[\033[0;31m\]$([ \j -gt 0 ] && echo [\j])\033[0m\][\h \[\033[0;36m\]\W\[\033[1;32m\] $(__git_ps1) \033[0m\]]\$ '
