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

function git-dirty {
if [[ $(git status | tail -n 1) == "nothing to commit, working directory clean" ]]
then
    echo ""
  else
      echo '\033[0;31m'*''
    fi
}

function git-unpushed {
local branch=$(git rev-parse --abbrev-ref HEAD)

if [[ $(git branch -v | grep $branch) == *'ahead'* ]]
then
  echo '\033[0;31m'$(git branch -v | grep $branch | cut -d " " -f3-5)
fi
}

function set-terminal-title {
  local title=$(pwd)

  title=${title#$SRCPATH/}
  title=${title/${HOME}/\~}

  if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null ); then
    title="$title @ \033[1;32m$branch $(git-dirty) $(git-unpushed)"
  fi
  echo -ne '\033[0;36m'$title'\033[0m'
}

function __git_ps1 {
   git rev-parse --abbrev-ref HEAD 2>/dev/null
}

export PS1='\[\033[0;31m\]$([ \j -gt 0 ] && echo [\j])\033[0m\]\033[0;31m❤  $(set-terminal-title)| '
#export PS1='\[\033[0;31m\]$([ \j -gt 0 ] && echo [\j])\033[0m\][\h \[\033[0;36m\]\W\[\033[1;32m\] $(__git_ps1) \033[0m\]]\$ '
