#!/bin/bash

export CL_HOME=~/Projects/clroot
export DEV_HOME=~/Projects/dev
source "$DEV_HOME/bin/dev-completion.bash"

if [ -f /usr/local/arcanist/resources/shell/bash-completion ] ; then
    source /usr/local/arcanist/resources/shell/bash-completion
fi

alias bogo="$CL_HOME/sweeper/bogo.py"
alias run-tests='arc unit `find -type d | grep __tests__`'

alias dashy='cdp && cd dashy && python server.py --api_host=http://localhost:8885 --port=9002'
alias dashy-server='cdp && cd td_metrics && python server.py --mongo_host=10.10.201.33 --mongo_db=sweeper_metrics'
alias metrics-server='cdp && cd td_metrics && python server.py --mongo_host=10.10.201.33 --mongo_db=sweeper_metrics'

alias sweeper-tests='cd $CL_HOME/sweeper && arc unit `find -type d | grep __tests__ | grep -v merchant_dashboard`'
alias merchant-tests='cd $CL_HOME/sweeper/merchant_dashyboard ; arc unit `find -type d | grep __tests__`'

function sshfe() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py fe $*`
}

function sshindexer {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py product-indexer $*`
}

function sshsolrcloud {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py solr-dc1 $*`
}

function sshcampaign() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py cmpgn $*`
}

function sshbe() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py be $*`
}

function sshtest() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py test $*`
}

function sshsandbox() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py sandbox $*`
}

function sshbesandbox() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py be-sandbox $*`
}

function sshmerchfe() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py merc $*`
}

function sshmerchbe() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py merc-be $*`
}

function sshsqs() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py sqs $*`
}

function sshmerchtest() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py merc-test $*`
}

function sshmerchsandbox() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py merc-sandbox $*`
}

function sshmerchbesandbox() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py merc-be-sandbox $*`
}

function sshadmin() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py admin $*`
}

function sshrc() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py rc $*`
}

function sshi() {
    ssh -o "StrictHostKeyChecking=no" $USER@`$CL_HOME/sweeper/scripts/infra/get_hostname.py $*`
}

function sshcanary() {
    ssh -o "StrictHostKeyChecking=no" $USER@`/$CL_HOME/sweeper/scripts/infra/get_hostname.py canary $*`
}


function run_sweeper_tests() {
    arc unit $(find . -name merchant_dashboard -prune -o -type d -print | grep __tests__)
}

function run_merchant_tests() {
    arc unit $(find . -type d | grep __tests__)
}
