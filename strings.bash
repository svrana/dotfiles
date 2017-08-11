#!/usr/bin/env bash
#
# Copyright (c) 2003-2004 by William Park <opengeometry@yahoo.ca>.
# All rights reserved.
#
# string[a:b] --> ${string:a:n}
#
# Convert Python-style string[a:b] range into Shell-style ${string:a:n} range,
# where
#	0 <= a <= b <= size  and  a + n = b
#
# Allows for specification of a substring for strcat(), strcpy(), and strcmp()
# using Python-style [a:b] range as the third parameter, like this:
#
#    b=0123456789
#    strcpy x $b :3		# x=012
#    strcpy y $b -3:		# y=789
#    strcpy z $b 1:-1		# z=12345678
#    echo $x $y $z
#
function python_to_shell_range() {
    local -i size=$3
    local -i b=${2:-$size}
    local -i a=${1:-0}

    if [ $# -ne 3 ]; then
	echo "Usage: python_to_shell_range a b size"
	return 2
    fi

    [[ $a -lt 0 ]] && a=$((a+size))
    [[ $a -lt 0 ]] && a=0
    [[ $a -gt $size ]] && a=$size

    [[ $b -lt 0 ]] && b=$((b+size))
    [[ $b -lt 0 ]] && b=0
    [[ $b -gt $size ]] && b=$size
    [[ $b -lt $a ]] && b=$a

    echo "$a" $((b-a))
}

function strcat() {
    local VAR=$1
    local STRING=$2
    local a
    local b

    case $#.$3 in
	2.) ;;
	3.*:*) a=${3%:*} b=${3#*:}
	    set -- `python_to_shell_range "$a" "$b" ${#STRING}`
	    STRING=${STRING:$1:$2}
	    ;;
	*)  echo "Usage: strcat var string [a:b]"
	    return 2
	    ;;
    esac
    eval "$VAR=\${$VAR}\$STRING"
}

function strcpy() {
    local VAR=$1
    local STRING=$2
    local a
    local b

    case $#.$3 in
	2.) ;;
	3.*:*) a=${3%:*} b=${3#*:}
	    set -- `python_to_shell_range "$a" "$b" ${#STRING}`
	    STRING=${STRING:$1:$2}
	    ;;
	*)  echo "Usage: strcpy var string [a:b]"
	    return 2
	    ;;
    esac
    eval "$VAR=\$STRING"
}

function strlen() {
    for i in "$@"; do
	echo ${#i}
    done
}

function strcmp() {
    local STRING1=$1
    local STRING2=$2
    local a
    local b

    case $#.$3 in
	2.) ;;
	3.*:*) a=${3%:*} b=${3#*:}
	    set -- `python_to_shell_range "$a" "$b" ${#STRING1}`
	    STRING1=${STRING1:$1:$2}
	    set -- `python_to_shell_range "$a" "$b" ${#STRING2}`
	    STRING2=${STRING2:$1:$2}
	    ;;
	*)  echo "Usage: strcmp string1 string2 [a:b]"
	    return 2
	    ;;
    esac
    [ "$STRING1" == "$STRING2" ]
}
