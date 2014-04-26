#!/usr/local/bin/zsh

if (( $+commands[git] ))
then
  git=$commands[git]
else
  git=/usr/local/bin/git
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ "$st" =~ ^nothing ]]
    then
      echo "%{$fg_bold[black]%}:$(git_prompt_info):%{$reset_color%}"
    else
      echo "%{$fg_bold[red]%}:$(git_prompt_info):%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rb_prompt(){
  if (( $+commands[rbenv] ))
  then
          echo "%{$fg_bold[yellow]%}$(rbenv version | awk '{print $1}')%{$reset_color%}"
        else
          echo ""
  fi
}
