#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Ignore commands prefixed with one or more spaces, and remove duplicates prior
# insertion in history file.
HISTCONTROL=ignoreboth

# Ensure you cannot kill shell with Ctrl-D
IGNOREEOF=10
set -o ignoreeof

# Ignore case with tab completion
set completion-ignore-case on

BASH_ALIAS_FILE=$HOME/.bash_aliases

# Source bash aliases if the file exist
if [[ -f $HOME/.bash_aliases ]] ; then
    source "$BASH_ALIAS_FILE"
fi

# Check for missing commands using pkgfile database if completion logi found.
if [[ -f /usr/share/doc/pkgfile/command-not-found.bash ]] ; then
    source /usr/share/doc/pkgfile/command-not-found.bash
fi

# Editor settings
export EDITOR="emacsclient --alternate-editor=emacs"

# Configure python virtualenv plumbing
if [[ -d $HOME/.virtualenvs ]] ; then
    source /usr/bin/virtualenvwrapper_lazy.sh
fi

# Automatically start X11 on virtual terminal 1
[[ -f $HOME/.xinitrc && -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx

# Add config for Common Lisp shelly utility
SHELLY_HOME=/home/al/.shelly;
[ -s "$SHELLY_HOME/lib/shelly/init.sh" ] && . "$SHELLY_HOME/lib/shelly/init.sh"
