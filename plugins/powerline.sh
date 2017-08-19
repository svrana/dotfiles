powerline_bash=~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
if [ -f $powerline_bash ]; then
    if [ -f "$(which powerline-daemon)" ]; then
        powerline-daemon -q
        export POWERLINE_BASH_CONTINUATION=1
        export POWERLINE_BASH_SELECT=1
        . $powerline_bash
    fi
fi

