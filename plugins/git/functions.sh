function push_to_master() {
    current_branch="$(git branch | grep ^* | cut -d' ' -f2)"
    cmd="git push origin $current_branch:master"
    ask Run \""$cmd"\"?
    if [ $? -eq 0 ]; then
	if [ "${BASH_VERSION}" ]; then
           ${cmd}
	else
	    eval "${cmd}"
	fi
    else
        echo "push aborted"
    fi
}

