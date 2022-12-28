
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin
export EDITOR=vim
export VISUAL=vim
export IDE=nvim
export RANGER_LOAD_DEFAULT_RC=0
export TERM=st
export PAGER=/usr/bin/moar

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prohibit overriding the existing file with '>'
set -o noclobber

# --- Prompt ---
RESET="\[$(tput sgr0)\]"
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
CYAN="\[$(tput setaf 5)\]"
SKY="\[$(tput setaf 6)\]"

function git_branch() {
    branch=$(git branch --show-current 2> /dev/null)

    if [ ! -z "$branch" ]; then
        status=$(git status --porcelain)

        if [ -n "$status" ]; then
            echo " ($branch*) "
        else
            echo " ($branch) "
        fi
    fi
}

export PS1="${GREEN}[\w]${RESET}${BLUE}\$(git_branch)${RESET}\$ "

# --- Aliases ---
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --group-directories-first -F --color=always'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -C'

alias cp='cp -v'

alias shcfg="$IDE ~/.bashrc"
alias wmcfg="cd ~/dots/dwm/; $IDE config.h"
alias termcfg="cd ~/dots/st/; $IDE config.h"
alias nvcfg="cd ~/dots/conf/.config/nvim/; $IDE"

PACMAN="paru"

alias xi="$PACMAN -Syu"
alias xr="$PACMAN -Rs"
alias xs="$PACMAN -Ss"
alias xf="pkgfile"
alias xc="$PACMAN -Scc"

alias dmnt="udisksctl mount -b"
alias dumnt="udisksctl unmount -b"

alias brs="brightnessctl set"

alias sts="stencil start"
alias stp="stencil push -da"

alias exa="exa -F --group-directories-first --icons"
alias tr="trash"
alias ts="trash-restore"

alias x="startx"


#Openvpn
function v() {
    cmd=$1
    name=$2
    usage="Usage: $(basename $0) <cmd> <name>. cmd: r - reconnect; c - connect; k - kill"


    if [ -z "$name" ]; then
        echo $usage
        exit 1
    fi

    case "$cmd" in
        r) sudo systemctl restart "openvpn-client@$name.service"
        ;;
        c) sudo systemctl start "openvpn-client@$name.service"
        ;;
        k) sudo systemctl stop "openvpn-client@$name.service"
        ;;
        *) echo $usage
        ;;
    esac
}

# fnm
export PATH="/home/kernelpanic/.local/share/fnm:$PATH"
eval "`fnm env`"


function npm_install_all() {
    root="$1"

    cd $root

    for dir in *; do
        if [ ! -d "$dir" ]; then
            echo 'Please specify target directory'
            exit 1
        fi

        cd "$dir"

        if [ -d 'node_modules' ]; then
            echo 'Already installed'
        else
            if [ -f 'package.json' ]; then
                if [ -f 'yarn.lock' ]; then
                    echo 'Found yarn project. Installing...'
                    yarn install
                elif [ -f 'package-lock.json' ];then
                    echo 'Found npm project. Installing...'
                    npm i
                else
                    echo 'No lock file. Asuming npm...'
                    npm i
                fi
            else
                echo 'Not a node project. Exiting'
            fi
        fi

        cd ..
    done
}

#Backup stuff

backup_targets="~/Music ~/password.kdbx ~/Books ~/dots --exclude dist --exclude build --exclude node_modules --exclude target ~/adev"
alias bk-update="tar -vcf ~/.backup.tar $backup_targets"

function sub_add() {
    url=$1
    real_url="$(ytfzf --channel-link=$url)"

    echo $real_url >> ~/dots/conf/.config/ytfzf/subscriptions
}
