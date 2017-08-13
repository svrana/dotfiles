# Ignore some extra directories
#export FZF_DEFAULT_COMMAND="find * -path */\.* -prune -o -type d \( -path node_modules \) -prune -o -type f -print -o -type l -print 2> /dev/null"

# Setup fzf
# ---------
#if [[ ! "$PATH" == */home/shaw/repos/fzf/bin* ]]; then
#  export PATH="$PATH:/home/shaw/repos/fzf/bin"
#fi

# Man path
# --------
if [[ ! "$MANPATH" == *$REPOS/fzf/man* && -d "$REPOS/fzf/man" ]]; then
  export MANPATH="$MANPATH:$REPOS/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$REPOS/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$REPOS/fzf/shell/key-bindings.bash"

