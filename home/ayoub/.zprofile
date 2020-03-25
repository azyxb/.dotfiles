sudo xbacklight -set 50
# From https://wiki.gentoo.org/wiki/X_without_Display_Manager
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx -- vt1; fi
