#!/bin/bash

# Living without this is just silly.
#
# Kind of like pgrep -fa except better output imo
#
function is() {
    if [ -z "$1" ]; then
        return
    fi

    ps -ef | head -n1 ; ps -ef | grep -v grep | grep "$@" -i --color=auto;
}

#
# Just like is but without the header which makes it easier to use when
# scripting or piping output to other commands. (Consider using pgrep -fc)
#
function iss() {
    if [ -z "$1" ]; then
        return
    fi

    ps -ef | grep -v grep | grep "$@" -i ;
}
