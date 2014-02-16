# Copyright (c) 2003-2004 by William Park <opengeometry@yahoo.ca>.
# All rights reserved.

# string[a:b] --> ${string:a:n}
#
# Convert Python-style string[a:b] range into Shell-style ${string:a:n} range,
# where
#	0 <= a <= b <= size  and  a + n = b
#
python_to_shell_range ()
{
    local -i size=$3
    local -i b=${2:-$size}
    local -i a=${1:-0}

    if [ $# -ne 3 ]; then
	echo "Usage: python_to_shell_range a b size"
	return 2
    fi

    [[ a -lt 0 ]] && a=$((a+size))
    [[ a -lt 0 ]] && a=0
    [[ a -gt size ]] && a=$size

    [[ b -lt 0 ]] && b=$((b+size))
    [[ b -lt 0 ]] && b=0
    [[ b -gt size ]] && b=$size
    [[ b -lt a ]] && b=$a

    echo $a $((b-a))
}

strcat ()		# var+=string
{
    local _VAR=$1 _STRING=$2 _a _b

    case $#.$3 in
	2.) ;;
	3.*:*) _a=${3%:*} _b=${3#*:}
	    set -- `python_to_shell_range "$_a" "$_b" ${#_STRING}`
	    _STRING=${_STRING:$1:$2}
	    ;;
	*)  echo "Usage: strcat var string [a:b]"
	    return 2
	    ;;
    esac
    eval "$_VAR=\${$_VAR}\$_STRING"
}

strcpy ()		# var=string
{
    local _VAR=$1 _STRING=$2 _a _b

    case $#.$3 in
	2.) ;;
	3.*:*) _a=${3%:*} _b=${3#*:}
	    set -- `python_to_shell_range "$_a" "$_b" ${#_STRING}`
	    _STRING=${_STRING:$1:$2}
	    ;;
	*)  echo "Usage: strcpy var string [a:b]"
	    return 2
	    ;;
    esac
    eval "$_VAR=\$_STRING"
}

strlen ()		# echo ${#string} ...
{
    for i in "$@"; do
	echo ${#i}
    done
}

strcmp ()		# string == string
{
    local _STRING1=$1 _STRING2=$2 _a _b
  
    case $#.$3 in
	2.) ;;
	3.*:*) _a=${3%:*} _b=${3#*:}
	    set -- `python_to_shell_range "$_a" "$_b" ${#_STRING1}`
	    _STRING1=${_STRING1:$1:$2}
	    set -- `python_to_shell_range "$_a" "$_b" ${#_STRING2}`
	    _STRING2=${_STRING2:$1:$2}
	    ;;
	*)  echo "Usage: strcmp string1 string2 [a:b]"
	    return 2
	    ;;
    esac
    [ "$_STRING1" == "$_STRING2" ]
}

testchain ()		# string OP string OP string ...
{
    if [ $# -lt 3 ]; then
	echo "Usage: testchain string OP string [OP string ...]"
	return 2
    fi
    while [ $# -ge 3 ]; do
	test "$1" "$2" "$3" || return 1
	shift 2
    done
}
