#
# An enumeration of useful colors and other color related
# utilities.
#

tty -s
if [ "0" == "$?" ]; then
    use_color=true
else
    use_color=false
fi

if ! ${use_color} ; then
    export black=
    export red=
    export RED=
    export green=
    export yellow=
    export blue=
    export BLUE=
    export magenta=
    export cyan=
    export CYAN=
    export white=
    export grey=

    export GOOD=
    export WARN=
    export BAD=
    export NORMAL=
    export HILITE=
    export BRACKET=
else
    export black='\E[30;40m'
    export red='\e[01;31m'
    export RED='\e[38;5;198m'
    export green='\e[38;5;82m'
    export yellow='\E[38;5;3m'
    export blue='\E[34;40m'
    export BLUE='\E[38;5;75m'

    export magenta='\E[35;40m'
    export cyan='\E[04;36m'
    export CYAN='\E[1;36m'
    export white='\E[37;0m'
    export grey='\E[37;40m'
    export darkgrey='\E[32;01m'

    export GOOD=$green
    export BAD=$RED
    export WARN='\E[33;01m'
    export NORMAL='\E[0m'
    export HILITE='\E[36;01m'
    export BRACKET='\E[34;01m'
fi


function colors() {
    iter=16
    while [ $iter -lt 52 ]
    do
	two=$((iter+36))
	three=$((two+36))
	four=$((three+36))
	five=$((four+36))
	six=$((five+36))
	seven=$((six+36))
        if [ $seven -gt 250 ]; then
	    seven=$((seven-251));
	fi

	printf "\033[38;5;${iter}m█ %03d" "$iter"
	printf "  \033[38;5;${two}m█ %03d" "$two"
        printf "  \033[38;5;${three}m█ %03d" "$three"
	printf "  \033[38;5;${four}m█ %03d" "$four"
	printf "  \033[38;5;${five}m█ %03d" "$five"
	printf "  \033[38;5;${six}m█ %03d" "$six"
	printf "  \033[38;5;${seven}m█ %03d" "$seven"

	iter=$((iter+1))
        printf '\r\n'
    done
}


# LESS_TERMCAP_mb=$(printf '%s' "$red") # enter blinking mode - red
# export LESS_TERMCAP_mb
# LESS_TERMCAP_md=$(printf '%s' "$BLUE") # enter double-bright mode
# export LESS_TERMCAP_md
# LESS_TERMCAP_me=$(printf '%s' "$NORMAL") # turn off all appearance modes (mb, md, so, us)
# export LESS_TERMCAP_me
# LESS_TERMCAP_se=$(printf '%s' "$NORMAL") # leave standout mode
# export LESS_TERMCAP_se
# LESS_TERMCAP_so=$(printf '%s' "$yellow") # enter standout mode - yellow
# export LESS_TERMCAP_so
# LESS_TERMCAP_ue=$(printf '%s' "$NORMAL") # leave underline mode
# export LESS_TERMCAP_ue
# LESS_TERMCAP_us=$(printf '%s' "$CYAN") # enter underline mode - cyan
# export LESS_TERMCAP_us
