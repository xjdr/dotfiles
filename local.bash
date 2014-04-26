
#------------------------------
# Alias stuff
#------------------------------
alias df="df -hT"
alias more='less'
alias mkdir='mkdir -p -v'
alias rmdir="rm -rf"
alias ..='cd ..'
alias b="cd -"
alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias da='date "+%A, %B %d, %Y [%T]"'
alias hist='history | grep $1'               # requires an argument
alias qq="exit"
alias sudo="sudo "
alias sudp="sudo "
alias reboot="sudo /sbin/shutdown -r now"
alias shutdown="sudo /sbin/shutdown -h now"
alias vt="vim ~/todo"
alias free='free -m'                         # show sizes in MB
alias c='clear'                              # clear screen
alias sv='sudo vim'                          # lazy

# ls
alias ls='ls -GpFh'
alias lr='ls -R'                             # recursive ls
alias lx='ll -BX'                            # sort by extension
alias lz='ll -rS'                            # sort by size
alias lt='ll -rt'                            # sort by date
alias ll='ls -lh'                            # list detailed with human-readable sizes
alias la='ls -a'                             # list all files
alias dir='ls -1'                            # windows-style list
alias lm='la | more'
alias lal="ls -Al"
alias lh="ls -Alh"
alias lS="ls -lS"
alias lSr="ls -lSr"
alias lt="ls -lt"
alias ltr="ls -ltr"
alias lX="ls -lX"

#grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias g="egrep"
alias f='find | grep'                        # quick search

#ps
alias psh="ps -u `whoami` -U `whoami` -o user,pid,pcpu,pmem,stat,start_time,comm -H"
alias psp="ps -u `whoami` -U `whoami` -o user,pid,pcpu,pmem,stat,start_time,comm --sort pcpu"
alias sps='ps aux | grep -v grep | grep'     # search process
alias psm="echo '%CPU %MEM   PID COMMAND' && ps hgaxo %cpu,%mem,pid,comm | sort -nrk1 | head -n 10 | sed -e 's/-bin//' | sed -e 's/-media-play//'"

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
