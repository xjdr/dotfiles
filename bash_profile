export CC=/usr/bin/gcc
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=gxGxFxdxbxDxDxBxBxExEx

export HISTCONTROL=erasedups
export HISTSIZE=100000
shopt -s histappend

## extras
[[ -s "${HOME}/.extras.bash" ]] && source "${HOME}/.extras.bash"

export PATH=/usr/local/bin:$PATH

  source "/Users/jefrose/.git-completion.bash"
  export PS1='[\h \[\033[0;36m\]\W\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '

source ${HOME}/.extras.bash

[[ -s ${HOME}/.local.bash ]] && source ${HOME}/.local.bash
export PYTHONSTARTUP=$HOME/.pythonrc.py
source /Users/jefrose/.rvm/scripts/rvm
