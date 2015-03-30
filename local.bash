
#------------------------------
# Alias stuff
#------------------------------
alias df="df -hT"
alias more='less'
alias mkdir='mkdir -p -v'
alias rmdir="rm -rf"
alias ..='cd ..'
alias da='date "+%A, %B %d, %Y [%T]"'
alias hist='history | grep $1'               # requires an argument
alias reboot="sudo /sbin/shutdown -r now"
alias shutdown="sudo /sbin/shutdown -h now"
alias c='clear'                              # clear screen

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # ls
  alias ls='ls --color=always -pFh'
  alias lal="ls -Al"
  #ps
  alias psh="ps -u `whoami` -U `whoami` -o user,pid,pcpu,pmem,stat,start_time,comm -H"
  alias psp="ps -u `whoami` -U `whoami` -o user,pid,pcpu,pmem,stat,start_time,comm --sort pcpu"
  alias sps='ps aux | grep -v grep | grep'     # search process
  alias psm="echo '%CPU %MEM   PID COMMAND' && ps hgaxo %cpu,%mem,pid,comm | sort -nrk1 | head -n 10 | sed -e 's/-bin//' | sed -e 's/-media-play//'"

elif [[ "$OSTYPE" == "darwin"* ]]; then
  # ls
  alias ls='ls -GpFh'
  alias lal="ls -Al"
  #ps
  alias psh="ps -u `whoami` -U `whoami` -o user,pid,pcpu,pmem,stat,start_time,comm -h"
  alias sps='ps aux | grep -v grep | grep'     # search process
  alias psm="echo '%CPU %MEM   PID COMMAND' && ps hgaxo %cpu,%mem,pid,comm | sort -nrk1 | head -n 10 | sed -e 's/-bin//' | sed -e 's/-media-play//'"
fi

#grep
alias grep="grep --color=auto"
alias f='find  . --name'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# mktar - tarball wrapper
# usage: mktar <filename | dirname>
function mktar() { tar czf "${1%%/}.tar.gz" "${1%%/}/"; }

# cd to a github repo
function gd {
  local parent=$(dirname "$1")
  local name=$(basename "$1")
  local owner=$(basename "$parent")
  local nwo="$owner/$name"
  local dir="$SRCPATH/$nwo"

  [ -e "$dir" ] || git clone "https://github.com/$nwo" "$dir"

  cd "$dir"
}


