export rvmsudo_secure_path=1
export RVM_PATH=~/.rvm

PATH_append $RVM_PATH/bin

[[ -s "$RVM_PATH/scripts/rvm" ]] && . "$RVM_PATH/scripts/rvm"
