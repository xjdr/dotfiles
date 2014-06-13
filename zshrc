# .zshrc - Jeff Rose :Minmal:

autoload -U colors zsh/terminfo # Used in the colour alias below
colors
setopt prompt_subst
#export CC=/usr/local/Cellar/gcc48/4.8.2/bin/gcc-4.8
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=gxGxFxdxbxDxDxBxBxExEx
export PYTHONSTARTUP=$HOME/.pythonrc.py
export HISTCONTROL=erasedups
export HISTSIZE=100000
export PATH=/usr/local/bin:~/bin:/usr/texbin:$PATH

# extras {{{
[[ -s ${HOME}/.extras.bash ]] && source ${HOME}/.extras.bash
[[ -s ${HOME}/.local.bash ]] && source ${HOME}/.local.bash
[[ -s ${HOME}/.rvm/scripts/rvm ]] && source ${HOME}/.rvm/scripts/rvm
[[ -s ${HOME}/.git-status.zsh ]] && source ${HOME}/.git-status.zsh

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}

# Window title {{{
precmd () { print -Pn "\e]0;%~ \a" }
preexec () { print -Pn "\e]0;%~ \a" }
# }}}

# Prompt {{{
#PROMPT="%{$bg_bold[red]%}%(1j.%j.)%{$reset_color%} %{$fg_bold[black]%}%c ➤ "
PROMPT="%{$fg_bold[magenta]%}%c ❯ "
RPROMPT=$'$(git_dirty)$(need_push)'
# }}}
