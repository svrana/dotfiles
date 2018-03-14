#!/bin/bash

# prompts for a y/n from user, returning 0 or 1 respectively
function ask() {
    echo -n "$@" '[y/N] ' ; read ans

    case "$ans" in
        y*|Y*)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Add newlines to path for readability
alias path='echo -e ${PATH//:/\\n}'
alias perlinc='perl -le "print for @INC"'
alias svi='sudo vi'
alias rvi='vi -R'
alias bzip='bzip2'
alias bunzip='bunzip2'
alias diff='diff -u'
alias rmkey='ssh-keygen -f "~/.ssh/known_hosts" -R'
alias upgrade='sudo apt update && sudo apt upgrade -y && sudo apt clean && sudo apt autoremove -y'
alias diskspace="du -S | sort -n -r |less"

function md() {
    [ -z "$1" ] && return
    mkdir "$1" && cd "$1"
}

function cores() {
    grep -c ^processor /proc/cpuinfo
}

function s() {
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

function extract() {
    if [ -f "$1" ] ; then
        case $1 in
            *.tar.bz2)   tar xjvf "$1"     ;;
            *.tar.gz)    tar xzvf "$1"     ;;
            *.tar.xz)    tar xvf "$1"      ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar e "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"      ;;
            *.tbz2)      tar xvjf "$1"     ;;
            *.tgz)       tar xvzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Remove all invalid directories from PATH
#
# @return String PATH
function PATH_clean() {
    local ruby_path=$(which ruby)
    if [ -z "$ruby_path" ]; then
        ebad "Could not find ruby!!" >&2
        return
    fi

    ruby -e "puts ENV['PATH'].split(':') \
        .inject([]) { |r,k| r << k if File.exist?(k) ; r } \
        .join(':')"
}

function PATH_prepend() {
    [ -z "$1" ] && return

    paths=$(echo "$1" | tr ":" "\n")
    for path in $paths ; do
        if [ "${PATH#*${path}}" = "${PATH}" ]; then
            export PATH=$path:$PATH
        fi
    done
}

function PATH_append() {
    [ -z "$1" ] && return

    paths=$(echo "$1" | tr ":" "\n")
    for path in $paths ; do
        if [ "${PATH#*${path}}" = "${PATH}" ]; then
            export PATH=$PATH:$path
        fi
    done
}

function CDPATH_append() {
    [ -z "$1" ] && return

    paths=$(echo "$1" | tr ":" "\n")
    for path in $paths ; do
        if [ "${CDPATH#*${path}}" = "${PATH}" ]; then
            export CDPATH=$CDPATH:$path
        fi
    done
}

function loopit() {
    if [ -z "$1" ]; then
        echo 'Must provide command to loop'
        return 1
    fi

    while true; do
        $(echo "$@") && break
        sleep .05 # allow ctrl-c out
    done
}

function sf() {
    if [ "$#" -lt 1 ]; then
        echo "Supply string to search for!"
        return 1
    fi
    printf -v search "%q" "$*"

    #include="yml,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst,sh,toml"
    exclude="tags,.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist,.berkshelf"
    #rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" -g "*.{'$include'}" -g "!{'$exclude'}/*"'
    #rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --color "always" -g "*.{'$include'}" -g "!{'$exclude'}/*"'
    #rg_command='rg --smart-case --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --color "always" -g "!{'$exclude'}/*"'
    #rg_command='rg --smart-case --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --color "always" -g "!{'$exclude'}/*"'
    rg_command='rg --smart-case --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --color "always" -g "!{'$exclude'}"'
    #echo "rg_commmand: $rg_command"
    files=$(eval "$rg_command" "$search" 2>/dev/null | fzf --height 80% --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}')
    files=$(echo "$files" | tr '\n' ' ' | sed -e 's/[[:space:]]*$//')
    [[ -n "$files" ]] && ${EDITOR:-vim} $files
}
