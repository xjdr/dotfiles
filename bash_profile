############################
# Don't edit this file
# Instead, put any customisations or personal bash preferences into the file ~/.local.bash
############################

#export RAILS_ENV='development'
#export RUBY_HEAP_MIN_SLOTS=500000
#export RUBY_HEAP_SLOTS_INCREMENT=250000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=50000000
#export RUBY_HEAP_FREE_MIN=4096

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

#export PATH=/opt/ebay/bin:/opt/ebay/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/mysql/bin:/Users/jefrose/bin:/Users/jefrose/.ebaytools/src/ebay-utilities/sbt:/Users/jefrose/.ebaytools/src/ebay-utilities/sbt11:/Users/jefrose/.ebaytools/src/ebay-utilities/bin:$PATH

  source "/Users/jefrose/.git-completion.bash"
  export PS1='[\h \[\033[0;36m\]\W\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '

source ${HOME}/.extras.bash

## rvm
#[[ -s "/opt/ebay/rvm/scripts/rvm" ]] && source "/opt/ebay/rvm/scripts/rvm"


## nvm
#[[ -e "/opt/ebay/nvm/nvm.sh" ]] && source "/opt/ebay/nvm/nvm.sh"
#[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

############################
# Don't edit this file
# Instead, put any customisations or personal bash preferences into the file ~/.local.bash
############################

[[ -s ${HOME}/.local.bash ]] && source ${HOME}/.local.bash
export PYTHONSTARTUP=$HOME/.pythonrc.py
 
source /Users/jefrose/.rvm/scripts/rvm
