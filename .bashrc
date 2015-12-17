#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

BASH_ALIAS_FILE=$HOME/.bash_aliases

# Source bash aliases if the file exist
if [[ -f $HOME/.bash_aliases ]] ; then

    source $BASH_ALIAS_FILE
    
fi

[[ -f $HOME/.xinitrc && -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
