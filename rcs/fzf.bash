# Ignore some extra directories
#export FZF_DEFAULT_COMMAND="find * -path */\.* -prune -o -type d \( -path node_modules \) -prune -o -type f -print -o -type l -print 2> /dev/null"

# Setup fzf
# ---------
#if [[ ! "$PATH" == */home/shaw/repos/fzf/bin* ]]; then
#  export PATH="$PATH:/home/shaw/repos/fzf/bin"
#fi

# Man path
# --------
if [[ ! "$MANPATH" == *$APPS/fzf/man* && -d "$APPS/fzf/man" ]]; then
  export MANPATH="$MANPATH:$APPS/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$APPS/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$APPS/fzf/shell/key-bindings.bash"

