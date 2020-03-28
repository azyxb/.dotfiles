#  .zshrc
#  
#  
#  
#      ___           ___           ___     
#     /\  \         /\  \         /\__\    
#     \:\  \       /::\  \       /:/  /    
#      \:\  \     /:/\ \  \     /:/__/     
#       \:\  \   _\:\~\ \  \   /::\  \ ___ 
# _______\:\__\ /\ \:\ \ \__\ /:/\:\  /\__\
# \::::::::/__/ \:\ \:\ \/__/ \/__\:\/:/  /
#  \:\~~\~~      \:\ \:\__\        \::/  / 
#   \:\  \        \:\/:/  /        /:/  /  
#    \:\__\        \::/  /        /:/  /   
#     \/__/         \/__/         \/__/      

# Path to your zsh installation.
export ZSH=$HOME/.zsh

# History
HISTFILE=~/.cache/zhistory

# Adds scripts and subdirectories to PATH
export PATH="$PATH:$(du "$HOME/Scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# MyThe[me]
ZSH_THEME="MyThe"

source $ZSH/.my-zsh.sh

#
#      ___           ___                   ___           ___           ___           ___     
#     /\  \         /\__\      ___        /\  \         /\  \         /\  \         /\  \    
#    /::\  \       /:/  /     /\  \      /::\  \       /::\  \       /::\  \       /::\  \   
#   /:/\:\  \     /:/  /      \:\  \    /:/\:\  \     /:/\ \  \     /:/\:\  \     /:/\ \  \  
#  /::\~\:\  \   /:/  /       /::\__\  /::\~\:\  \   _\:\~\ \  \   /::\~\:\  \   _\:\~\ \  \ 
# /:/\:\ \:\__\ /:/__/     __/:/\/__/ /:/\:\ \:\__\ /\ \:\ \ \__\ /:/\:\ \:\__\ /\ \:\ \ \__\
# \/__\:\/:/  / \:\  \    /\/:/  /    \/__\:\/:/  / \:\ \:\ \/__/ \:\~\:\ \/__/ \:\ \:\ \/__/
#      \::/  /   \:\  \   \::/__/          \::/  /   \:\ \:\__\    \:\ \:\__\    \:\ \:\__\  
#      /:/  /     \:\  \   \:\__\          /:/  /     \:\/:/  /     \:\ \/__/     \:\/:/  /  
#     /:/  /       \:\__\   \/__/         /:/  /       \::/  /       \:\__\        \::/  /   
#     \/__/         \/__/                 \/__/         \/__/         \/__/         \/__/    
     
# Misc
alias ls='ls --color=auto'
alias ghosts='/home/ayoub/Scripts/color-scripts/ghosts'
alias emacs="emacs -nw"
alias unix="curl -L git.io/unix"

# config
alias zshrc="emacs -nw /home/ayoub/.zshrc"
alias conf="sudoedit /etc/portage/make.conf"

# source
alias so='source /home/ayoub/.zshrc'

# dotfiles
alias dotss="dotfiles status"
alias dotsc="dotfiles commit -m 'Small change'"
alias dotsa="dotfiles add "
alias dotsp="dotfiles push"

# 'rona
alias rona="curl https://covid19tracker.xyz/fr"

# Use a long listing format
alias ll='ls -la'

# Cam
alias cam="mpv av://v4l2:/dev/video0"
alias video="ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac webcam.mp4"

# Turn off the screen and slock
alias nox="xset dpms force off"

# Show hidden files
alias l.='ls -d .* --color=auto'

# Get rid of command not found
alias cd..='cd ..'

# A quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'

# Firewall
alias showfirewall="sudo iptables -L -n"

# Confirmation 
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'

# free for humans
alias free="free -hm"

# Parenting changing perms on / 
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# Get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Clear the screen of your clutter
alias ccc="clear && ~/Scripts/.aura.sh"
alias clr="clear;ls;pwd"

# Bonsai
alias bonss="/home/ayoub/Scripts/bonsai/bonsai.sh -l -b 2"

# X
alias start="startx -- vt1"

# It wasn't useful
##alias downn="sudo tail -f /var/log/emerge-fetch.log"

# The gentoo
alias up="sudo emerge --update --newuse @world"
alias ascendio="sudo eix-sync"

# Others
##alias tt="watch sensors"
##alias gg="ping google.fr"
##alias log="sudo tail -f /var/log/messages"

# Printer
##alias printerr="sudo rc-service cupsd start"

# Test my notifications, but I don't have notifications anymore: they are useless
##alias notificationn="notify-send 'Hello world!' 'This is an example notification.' --icon=applications-development"

# The old one
##alias datee="sudo ntpdate pool.ntp.org"

# X
alias whorunx="ps -fC X"

# The system info
alias infoo="/home/ayoub/Scripts/info.sh"

# moon & rr
alias moon="curl wttr.in/Moon"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# SSD temperature
alias thetempofthessd="sudo smartctl /dev/sda -a | grep -i Temp"

# I mounted my usb like a real one
alias usssb="sudo mount -o rw,users,umask=000 /dev/sdb1 /media/usb"
alias mobilemount="mtpfs ~/Documents/phone"
alias moubileumount="fusermount -u ~/Documents/phone"

# portage is great
alias accio="sudo emerge"
##alias accio="sudo pacman -S"

# vi is great
#alias :q="exit"

# pfetch
alias pfetch="$HOME/Scripts/pfetch"

# Sorry
alias please='sudo $(fc -ln -1)'

#      ___           ___           ___           ___           ___                       ___           ___           ___     
#     /\  \         /\__\         /\__\         /\  \         /\  \          ___        /\  \         /\__\         /\  \    
#    /::\  \       /:/  /        /::|  |       /::\  \        \:\  \        /\  \      /::\  \       /::|  |       /::\  \   
#   /:/\:\  \     /:/  /        /:|:|  |      /:/\:\  \        \:\  \       \:\  \    /:/\:\  \     /:|:|  |      /:/\ \  \  
#  /::\~\:\  \   /:/  /  ___   /:/|:|  |__   /:/  \:\  \       /::\  \      /::\__\  /:/  \:\  \   /:/|:|  |__   _\:\~\ \  \ 
# /:/\:\ \:\__\ /:/__/  /\__\ /:/ |:| /\__\ /:/__/ \:\__\     /:/\:\__\  __/:/\/__/ /:/__/ \:\__\ /:/ |:| /\__\ /\ \:\ \ \__\
# \/__\:\ \/__/ \:\  \ /:/  / \/__|:|/:/  / \:\  \  \/__/    /:/  \/__/ /\/:/  /    \:\  \ /:/  / \/__|:|/:/  / \:\ \:\ \/__/
#      \:\__\    \:\  /:/  /      |:/:/  /   \:\  \         /:/  /      \::/__/      \:\  /:/  /      |:/:/  /   \:\ \:\__\  
#       \/__/     \:\/:/  /       |::/  /     \:\  \        \/__/        \:\__\       \:\/:/  /       |::/  /     \:\/:/  /  
#                  \::/  /        /:/  /       \:\__\                     \/__/        \::/  /        /:/  /       \::/  /   
#                   \/__/         \/__/         \/__/                                   \/__/         \/__/         \/__/    

# c
c ()
{
    clear
    echo "\033[0;35mmemory\033[0m"
    free -h | tail -n2
    echo "\033[0;35mdisk\033[0m"
    df -h
    echo "\033[0;35muptime\033[0m"
    uptime
}

# Open nano and make backup of original file. Useful for config files and things you don't want to edit the original
function nanobk () {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $1 $1.bak
    nano $1
}

# ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2|*.tbz2) tar xjf $1   ;;
      *.tar.gz|*.tgz)   tar xzf $1   ;;
      *.bz2)            bunzip2 $1   ;;
      *.rar)            unrar x $1     ;;
      *.gz)             gunzip $1    ;;
      *.tar)            tar xf $1    ;;
      *.zip)            unzip $1     ;;
      *.Z)              uncompress $1;;
      *.7z)             7z x $1      ;;
      *)                echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# To mkdir and cd
mcd () {
    mkdir -p $1
    cd $1
}


# To cd and ls
cl() {
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; ls -hall --color=auto
    else
        echo "zsh: cl: $dir: Directory not found"
    fi
}

# Calculator
calc() {
    echo "scale=3;$@" | bc -l
       }

# dotfiles
dotfiles() {
    case "$1" in
        listall)
            shift
            dotfiles ls-tree --full-tree -r --name-only HEAD "$@"
            ;;
            *)
            /usr/bin/env git --git-dir="$HOME/.dotfiles/" --work-tree="/" "$@"
            ;;
    esac
}
compdef dotfiles='git'

# Disk usage formatted
function duf {
du -sk "$@" | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done
}

# Mem
function mem {
ps -A --sort -rsz -o comm,rsz | awk 'NR<=15 {printf "%-20s %.2f MB\n", $1, $2/1024}' | sed '1s/0.00 MB/MEM/'
}

# To change from nano to emacs 
export EDITOR="emacs --no-window-system"

# Synatax
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
