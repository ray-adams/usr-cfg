# File Name: .zshrc
# File Path: ${XDG_CONFIG_HOME}/zsh/.zshrc
# Description: Main zsh configuration file.

# Copyright (c) 2024 Ray Adams
# SPDX-Licence-Identifier: BSD-3-Clause

# Version: 1.0.0

## Load aliases
[ -f "$ZDOTDIR/.zsh_aliases" ] && source "$ZDOTDIR/.zsh_aliases"

## Prompt
PS1="%B%F{10}[%n] %~%f%b "

# Options

autoload -U colors && colors

HISTFILE=/dev/null

setopt NO_AUTOLIST BASH_AUTOLIST NO_MENUCOMPLETE NO_AUTO_MENU
setopt HIST_IGNORE_SPACE

tabs 4

PROMPT_EOL_MARK=''

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Vi Mode

bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# Functions

## Save path on cd
function cd { 
    builtin cd $@
    pwd > ~/.cache/.last_dir
}
if [ -f ~/.cache/.last_dir ]
    then cd "$(cat ~/.cache/.last_dir)"
fi
