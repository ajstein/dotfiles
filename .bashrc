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

# Configure python virtualenv plumbing
if [[ -d $HOME/.virtualenvs ]] ; then
    source $(which virtualenvwrapper.sh)
fi

# Automatically start X11 on virtual terminal 1
[[ -f $HOME/.xinitrc && -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
