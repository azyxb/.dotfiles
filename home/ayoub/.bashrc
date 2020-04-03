# .bashrc
#        ___           ___           ___           ___     
#       /\  \         /\  \         /\  \         /\__\    
#      /::\  \       /::\  \       /::\  \       /:/  /    
#     /:/\:\  \     /:/\:\  \     /:/\ \  \     /:/__/     
#    /::\~\:\__\   /::\~\:\  \   _\:\~\ \  \   /::\  \ ___ 
#   /:/\:\ \:|__| /:/\:\ \:\__\ /\ \:\ \ \__\ /:/\:\  /\__\
#   \:\~\:\/:/  / \/__\:\/:/  / \:\ \:\ \/__/ \/__\:\/:/  /
#    \:\ \::/  /       \::/  /   \:\ \:\__\        \::/  / 
#     \:\/:/  /        /:/  /     \:\/:/  /        /:/  /  
#      \::/__/        /:/  /       \::/  /        /:/  /   
#       ~~            \/__/         \/__/         \/__/    

#        ___           ___     
#       /\  \         /\  \    
#      /::\  \       /::\  \   
#     /:/\:\  \     /:/\ \  \  
#    /::\~\:\  \   _\:\~\ \  \ 
#   /:/\:\ \:\__\ /\ \:\ \ \__\
#   \/__\:\/:/  / \:\ \:\ \/__/
#        \::/  /   \:\ \:\__\  
#         \/__/     \:\/:/  /  
#                    \::/  /   
#                     \/__/    

smileystatus()
{
	if [ "$?" == "0" ]; then
		echo -e ' \e[0;32m:) '
	else
		echo -e ' \e[0;31m:( '
	fi
}
PS1='`smileystatus`'"\W > \[$(tput sgr0)\]"

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
alias bashrc="emacs -nw /home/ayoub/.bashrc"
alias conf="sudoedit /etc/portage/make.conf"

# source
alias so='source /home/ayoub/.bashrc'

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

# Do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'

# Firewall
alias showfirewall="sudo iptables -L -n"

# wrap these commands for interactive use to avoid accidental overwrites.
cp() { command cp -i "$@"; }
mv() { command mv -i "$@"; }
ln() { command ln -i "$@"; }

# free for humans
alias free="free -hm"

# Parenting changing perms on / 
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

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
##alias usssb="sudo mount -o rw,users,umask=000 /dev/sdb1 /media/usb"
##alias mobilemount="mtpfs ~/Documents/phone"
##alias moubileumount="fusermount -u ~/Documents/phone"

# portage is great
##alias accio="sudo emerge"
##alias accio="sudo pacman -S"

# vi is great
#alias :q="exit"

# pfetch
alias pfetch="$HOME/Scripts/pfetch"

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
    echo -e "\e[35mmemory\e[0m"
    free -h | tail -n2
    echo -e "\e[35mdisk\e[0m"
    df -h
    echo -e "\e[35muptime\e[0m"
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
# usage: extract <file>
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}


# To mkdir and cd
mkdircd () {
    mkdir -p $1
    cd $1
}

# To cd and ls
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# Take notes
note () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        printf "%s" > "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
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

# To complete
complete -c man which
complete -cf sudo

# HELP!!!
run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m emacs -x     '"\eh": run-help'

# auto cd
shopt -s autocd

# no double entries in the shell history
export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

# do not overwrite files when redirecting output by default.
set -o noclobber
