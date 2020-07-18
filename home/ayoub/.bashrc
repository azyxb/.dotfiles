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
alias c=clear

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
alias up="su -c 'emerge -Nu @world'"
alias ascendio="su -c 'emaint -a sync'"

# The old one
##alias datee="ntpdate pool.ntp.org"

# X
alias whox="ps -fC X"

# The system info
alias infoo="/home/ayoub/Scripts/info.sh"

# moon & rr
alias moon="curl wttr.in/Moon"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Do not sync more than one time a day, who needs to?
alias lasttime="cat /var/db/repos/gentoo/metadata/timestamp.chk"

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

# usb
usssb() {
    su -c 'mount -o rw,users,umask=000 $1 /media/usb'
}

# LaTex
pdf() {
    pdflatex $1 && pkill -HUP mupdf
}

# compile
compilation() {
    gcc `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0` -o browser browser.c `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
}

# djvu to pdf
djvu2pdf() {
    ddjvu -format=pdf -quality=85 -verbose $1 $1.pdf
}

# ARCHIVE EXTRACTION
# usage: extract <file>
extract() {
  local xcmd rc fsobj

  (($#)) || return
  rc=0
  for fsobj; do
    xcmd=''

    if [[ ! -r ${fsobj} ]]; then
      printf -- '%s\n' "$0: file is unreadable: '${fsobj}'" >&2
      continue
    fi

    [[ -e ./"${fsobj#/}" ]] && fsobj="./${fsobj#/}"

    case ${fsobj} in
      (*.cbt|*.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                xcmd=(bsdtar xvf)
      ;;
      (*.7z*|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                xcmd=(7z x)
      ;;
      (*.ace|*.cba)
                xcmd=(unace x)
      ;;
      (*.cbr|*.rar)
                xcmd=(unrar x)
      ;;
      (*.cbz|*.epub|*.zip)
                xcmd=(unzip)
      ;;
      (*.cpio)
                cpio -id < "${fsobj}"
                rc=$(( rc + "${?}" ))
                continue
      ;;
      (*.cso)
                ciso 0 "${fsobj}" "${fsobj}".iso
                extract "${fsobj}".iso
                rm -rf "${fsobj:?}"
                rc=$(( rc + "${?}" ))
                continue
      ;;
      (*.arc)   xcmd=(arc e);;
      (*.bz2)   xcmd=(bunzip2);;
      (*.exe)   xcmd=(cabextract);;
      (*.gz)    xcmd=(gunzip);;
      (*.lzma)  xcmd=(unlzma);;
      (*.xz)    xcmd=(unxz);;
      (*.Z|*.z) xcmd=(uncompress);;
      (*.zpaq)  xcmd=(zpaq x);;
      (*)       printf -- '%s\n' "$0: unrecognized file extension: '${fsobj}'" >&2
                continue
      ;;
    esac

    command "${xcmd[@]}" "${fsobj}"
    rc=$(( rc + "${?}" ))
  done
  (( rc > 0 )) && return "${rc}"
  return 0
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

# tabs to 4 spaces
tab24spaces() {
sed -e 's/\t/    /g' $1
}

# To complete
complete -c man which
#complete -cf sudo

HISTSIZE=100000
HISTFILESIZE=100000 
HISTCONTROL=ignoredups:erasedups

# autocd
shopt -s autocd histappend extglob
