#!/bin/bash

export WORKON_HOME=~/.virtualenvs

[ -f /usr/local/bin/virtualenvwrapper.sh ] && . /usr/local/bin/virtualenvwrapper.sh
[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ] && . /usr/share/virtualenvwrapper/virtualenvwrapper.sh

export VIRTUAL_ENV_DISABLE_PROMPT=1

# Make virtualenvwrapper use the .venv file to find the current
# python virtual environment. (Stolen from the virtualenvwrapper
# plugin for oh-my-zsh)
function prompt() {
    if [[ -z "$WORKON_CWD" ]]; then
        local WORKON_CWD=1
        # Get project path, ending at gitrepo, root or directory with .venv
        local PROJECT_ROOT=$PWD

        # not going to have a .venv in HOME and don't bother or above it
        while [[ "$PROJECT_ROOT" != "$HOME" &&
            "$PROJECT_ROOT" != "/" &&
            "$PROJECT_ROOT" != "" &&
            ! -e "$PROJECT_ROOT/.venv" &&
            ! -d "$PROJECT_ROOT/.git" ]]; do
            PROJECT_ROOT=${PROJECT_ROOT%/*}
        done
        #echo "PROJECT_ROOT: ${PROJECT_ROOT}"

        if [[ -f "$PROJECT_ROOT/.venv" ]]; then
            ENV_NAME="$(cat "$PROJECT_ROOT/.venv")"
        else
            ENV_NAME=""
        fi

        if [[ "$ENV_NAME" != "" ]]; then
            # Activate the environment only if it is not already active
            if [[ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]]; then
                if [[ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]]; then
                    #echo "Activating virtualenv $ENV_NAME"
                    workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
                fi
            fi
        elif [[ -n $CD_VIRTUAL_ENV && -n $VIRTUAL_ENV ]]; then
            #echo "deactivating"
            # We've just left the repo, deactivate the environment
            # Note: this only happens if the virtualenv was activated automatically
            deactivate && unset CD_VIRTUAL_ENV
        fi
    fi
}

OLD_PC=$PROMPT_COMMAND # hack to keep powerline working
PROMPT_COMMAND='prompt ; $OLD_PC'
