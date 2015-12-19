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
rofi &

# Start emacs daemon
emacs --daemon &

# Start the screensaver daemon to lock the screen
xscreensaver &

# The black/white grid as background doesn't suit my taste.
xsetroot -solid black &

# Start the ratpoison window manager
exec bash --login -c 'ratpoison'
