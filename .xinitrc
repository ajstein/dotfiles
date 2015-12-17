#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Personal X keyboard preferences
# lshift+rshift = toggle input language
# capslock = becomes ctrl key
# windows (mac command key) = becomes meta and windows key
setxkbmap -layout us,ar -option grp:shifts_toggle,caps:ctrl_modifier,altwin:meta_win

# Configure rofi as needed.
rofi -terminal 'emacsclient -c' -key-window Menu -key-run Insert -bg black -fg white -font "DejaVu Sans Mono 10" &

# Start emacs daemon
emacs --daemon &

# Start the screensaver daemon to lock the screen
xscreensaver &

# Start the ratpoison window manager
exec ratpoison
