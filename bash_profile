export CC=/usr/bin/gcc
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=gxGxFxdxbxDxDxBxBxExEx

export HISTCONTROL=erasedups
export HISTSIZE=100000
shopt -s histappend

## extras
[[ -s ${HOME}/.extras.bash ]] && source ${HOME}/.extras.bash
[[ -s ${HOME}/.local.bash ]] && source ${HOME}/.local.bash
[[ -s ${HOME}/.git-prompt.sh ]] && source ${HOME}/.git-prompt.sh

export PATH=/usr/local/bin:$PATH
export PYTHONSTARTUP=~/.pythonrc.py

export PS1='\[\033[0;31m\]$([ \j -gt 0 ] && echo [\j])\033[0m\][\h \[\033[0;36m\]\W\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '
