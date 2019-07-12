#!/bin/bash

export CL_HOME=~/Projects/clroot

if [ -f /usr/local/arcanist/resources/shell/bash-completion ] ; then
    source /usr/local/arcanist/resources/shell/bash-completion
fi

PATH_append "$CL_HOME/ci/bin"

export WISH_CLI_TOOL=OS_DEV
export DEV_CONFIG=$CL_HOME/.dev.yaml
export BUILDUID=$(id -u $USER)

alias wish-fe='dev sweeper sh python /home/app/clroot/sweeper/server.py --env=stage'
alias wish-be='dev sweeper sh python /home/app/clroot/sweeper/scripts/queue/sqs_worker.py --env=stage'
alias wish-dbshell='dev sweeper sh python /home/app/clroot/sweeper/merchant_dashboard/dbshell.py --env=stage'
alias wish-npm='dev sweeper sh "cd /home/app/clroot/sweeper/static && npm run dev"'

alias merch-fe='dev merchant sh python /home/app/clroot/sweeper/merchant_dashboard/server.py --env=stage'
alias merch-be='dev merchant sh python /home/app/clroot/sweeper/merchant_dashboard/workers/sqs_worker.py --env=stage'
alias merch-dbshell='dev merchant sh python /home/app/clroot/sweeper/merchant_dashboard/dbshell.py --env=stage'
alias merch-npm='dev merchant sh "cd /home/app/clroot/sweeper/merchant_dashboard/static/js && npm run dev"'
