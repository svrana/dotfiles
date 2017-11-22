#!/bin/bash
#
# Many of these from gentoo @
#   https://github.com/gentoo/gentoo-functions/blob/master/functions.sh
#

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/colors.sh"

# Safer way to list the contents of a directory as it doesn't have the 'empty
# dir bug'.
#
# char *dolisting(param)
#
#    print a list of the directory contents
#
#    NOTE: quote the params if they contain globs.
#          also, error checking is not that extensive
function dolisting() {
    local x=
    local y=
    local tmpstr=
    local mylist=
    local mypath="$*"

    if [[ ${mypath%/\*} != "${mypath}" ]] ; then
        mypath=${mypath%/\*}
    fi

    for x in ${mypath} ; do
        [[ ! -e ${x} ]] && continue

        if [[ ! -d ${x} ]] && [[ -L ${x} || -f ${x} ]] ; then
            mylist="${mylist} $(ls "${x}" 2> /dev/null)"
        else
            [[ ${x%/} != "${x}" ]] && x=${x%/}

            cd "${x}"; tmpstr=$(ls)

            for y in ${tmpstr} ; do
                mylist="${mylist} ${x}/${y}"
            done
        fi
    done

    echo "${mylist}"
}

# void ebox(void)
# 	indicates a failure in a "box"
function ebox() {
    echo -e "${ENDCOL}  ${BRACKET}[ ${BAD}!!${BRACKET} ]${NORMAL}"
}

# void sbox(void)
# 	indicates a success in a "box"
function sbox() {
    echo -e "${ENDCOL}  ${BRACKET}[ ${GOOD}ok${BRACKET} ]${NORMAL}"
}

function egood() {
    echo "$*"
    sbox
}

function ebad() {
    echo "$*"
    ebox
}

function estatus() {
    if [ $? -eq 0 ]; then
        egood "$*"
    else
        ebad "$*"
    fi
}

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
alias ack='ack-grep'
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
    export PATH=$1:$PATH
}

function PATH_append() {
    [ -z "$1" ] && return
    export PATH=$PATH:$1
}

function CDPATH_append() {
    [ -z "$1" ] && return
    export CDPATH=$CDPATH:$1
}

function docker_rm_dangling() {
    docker images -qf dangling=true | xargs --no-run-if-empty docker rmi
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

  include="yml,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst"
  exclude=".config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist,.berkshelf"
  #rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" -g "*.{'$include'}" -g "!{'$exclude'}/*"'
  rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --color "always" -g "*.{'$include'}" -g "!{'$exclude'}/*"'
  files=$(eval "$rg_command" "$search" 2>/dev/null | fzf --height 80% --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}')
  files=$(echo "$files" | tr '\n' ' ' | sed -e 's/[[:space:]]*$//')
  #shellcheck disable=SC2086
  [[ -n "$files" ]] && ${EDITOR:-vim} $files
}
