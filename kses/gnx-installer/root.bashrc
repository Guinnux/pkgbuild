#
# Setup special prompts for root
#

NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="$RED\u@\h:\w # $NORMAL"
