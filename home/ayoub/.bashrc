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

# To change from nano to emacs 
export EDITOR="/usr/bin/mg"

alias c=clear
alias thekernelinplace="sudo cp arch/x86/boot/bzImage /boot/EFI/Gentoo/bzImage.efi" 

# SCIPY
export SCIPY_PIL_IMAGE_VIEWER=sxiv

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

sstatus()
{
	if [ "$?" == "0" ]; then
		echo -e '\e[0;32m'
	else
		echo -e '\e[0;31m'
	fi
}

PS1='\[$(sstatus)\] \W > \[$(tput sgr0)\]'

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

# mpv
alias mpv="mpv --save-position-on-quit --no-audio-display"

# source
alias so='source /home/ayoub/.bashrc'

# dotfiles
alias dotss="dotfiles status"
alias dotsc="dotfiles commit -m 'Small change'"
alias dotsa="dotfiles add "
alias dotsp="dotfiles push"

# Cam
alias cam="mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0"
alias video="ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac webcam.mp4"

# Turn off the screen
alias nox="xset dpms force off"

# Get rid of command not found
alias cd..='cd ..'

# Firewall
alias showfirewall="sudo iptables -L -n"

# Do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'

# wrap these commands for interactive use to avoid accidental overwrites.
cp() { command cp -i "$@"; }
mv() { command mv -i "$@"; }
ln() { command ln -i "$@"; }

# Clear the screen
alias ccc="clear && ~/Scripts/.aura.sh"
alias clr="clear;ls;pwd"

# Bonsai
alias bonsai="/home/ayoub/Scripts/bonsai/bonsai.sh -l -b 2"

# X
alias start="startx -- vt1"

# The gentoo
alias up="sudo emerge --update --newuse @world"
alias ascendio="sudo emerge --sync"

# Printer
alias starttheprinter="sudo rc-service cupsd start"

# The old one
##alias datee="sudo ntpdate pool.ntp.org"

# X
alias whox="ps -fC X"

# The system info
alias infoo="/home/ayoub/Scripts/info.sh"

# moon & rr
alias moon="curl wttr.in/Moon"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# SSD temperature
alias thetempofthessd="sudo smartctl /dev/sda -a | grep -i Temp"

# portage is great
alias accio="sudo emerge"
alias lasttime="cat /var/db/repos/gentoo/metadata/timestamp.chk"
##alias accio="sudo pacman -S"

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

# Open nano and make backup of original file. Useful for config files and things you don't want to edit the original
ebk() {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $1 $1.bak
    emacs -nw $1
}

# I mount my usb like a real one
usssb() {
    sudo mount -o rw,users,umask=000 $1 /media/usb
}

# LaTex
pdf() {
    pdflatex $1 && pkill -HUP mupdf
}

# djvu to pdf
djvu2pdf() {
    ddjvu -format=pdf -quality=85 -verbose $1 $1.pdf
}

# ARCHIVE EXTRACTION
# usage: ex <file>
ex() {
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
note() {
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
duf() {
du -sk "$@" | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done
}

# Mem
mem() {
ps -A --sort -rsz -o comm,rsz | awk 'NR<=15 {printf "%-20s %.2f MB\n", $1, $2/1024}' | sed '1s/0.00 MB/MEM/'
}

# test microphone
test-microphone() {
arecord -vvv -f dat /dev/null
}

# To complete
complete -c man which
complete -cf sudo

# HELP!!!
run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'
bind -m emacs -x     '"\eh": run-help'

HISTSIZE=100000
HISTFILESIZE=100000 
HISTCONTROL=ignoredups:erasedups

# autocd
shopt -s autocd histappend
