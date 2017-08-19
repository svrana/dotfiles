#
# Collection of functions and aliases
#

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

# ff dogbutt
# 	Find a file with case insensitive pattern in name, removing fluff.
function ff() {
    find . -iname '*'$1'*' -printf "%P\n" 2>/dev/null
}

# ff dogbutt rm
# 	Find a file with case insensitive pattern $1 in name and execute $2 on it.
function fe() {
    find . -type f -iname '*'"$1"'*' -exec "${2:-file}" {} \;
}

# ff client
# 	Find any type of file, removing fluff.
function fa() {
    find . -iname '*'"$1"'*' -printf "%P\n" 2>/dev/null
}

#
# Living without this is just silly.
#
# unless you like pgrep
#
function is() {
    if [ -z "$1" ]; then
        return
    fi

    ps -ef | head -n1 ;\
        ps -ef | grep -v grep | grep "$@" -i --color=auto;
}

#
# Just like is but without the header which makes it easier to use when
# scripting or piping output to other commands.
#
function iss() {
    if [ -z "$1" ]; then
        return
    fi

    ps -ef | grep -v grep | grep "$@" -i --color=auto;
}

# Add newlines to path for readability
alias path='echo -e ${PATH//:/\\n}'
alias classpath='echo -e ${CLASSPATH//:/\\n}'
alias gopath='echo -e ${GOPATH//:/\\n}'
alias pythonpath='echo -e ${PYTHONPATH//:/\\n}'

#
# Create a random password
#
# @param length  default 12
#
function rpass() {
    tr -cd '[:graph:]' < /dev/urandom | head -c "${1:-12}" && echo

}

# find
alias drmo='find . -name "*.o" -delete'

# cd
alias cdc='cd $CONFIG_DIR'
alias cd..='cd ..'
alias ..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias kvswap='find . -iregex ^.*.swp?o? -delete'
alias svi='sudo vi'
alias rvi='vi -R'

alias bzip='bzip2'
alias bunzip='bunzip2'
alias diff='diff -u'

alias ack='ack-grep'

### ruby ###
alias br='bundle exec rake'
alias be='bundle exec'

### tmux ###
alias tma='tmux attach -d -t'
alias tmux='deactivate 2>/dev/null 1>&2 ; direnv exec / tmux'

# create named tmux session, i.e., tmux new -s dev
function tmn() {
    if [ -z "$1" ]; then
        tmux
    else
        tmux new-session -s "$1"
    fi
}

alias rmkey='ssh-keygen -f "~/.ssh/known_hosts" -R'

alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean && sudo apt autoremove'

function md() {
    mkdir "$1"
    cd "$1"
}

function cores() {
    grep -c ^processor /proc/cpuinfo
}

alias perlinc='perl -le "print for @INC"'

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
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.tar.xz)    tar xf "$1"      ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.rar)       unrar e "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.tar)       tar xf "$1"      ;;
        *.tbz2)      tar xjf "$1"     ;;
        *.tgz)       tar xzf "$1"     ;;
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
function cleaned_path() {
    ruby_path=$(which ruby)
    if [ -z "$ruby_path" ]; then
	ebad "Could not find ruby!!" >&2
	return
    fi

    ruby -e "puts ENV['PATH'].split(':') \
                             .inject([]) { |r,k| r << k if File.exist?(k) ; r } \
                             .join(':')"
}

alias diskspace="du -S | sort -n -r |less"

function docker_rm_dangling() {
    docker images -qf dangling=true | xargs --no-run-if-empty docker rmi
}

function PATH_prepend() {
    [ -z "$1" ] && return
    export PATH=$1:$PATH
}

function PATH_append() {
    [ -z "$1" ] && return
    export PATH=$PATH:$1
}
