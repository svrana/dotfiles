# Shaw: improve on this to ignore directories (node_modules, etc)
# FZF_DEFAULT_COMMAND=find * -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/nullefine('pg_user', type=str, default='silverwing')


# Setup fzf
# ---------
if [[ ! "$PATH" == */home/shaw/repos/fzf/bin* ]]; then
  export PATH="$PATH:/home/shaw/repos/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/shaw/repos/fzf/man* && -d "/home/shaw/repos/fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/shaw/repos/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/shaw/repos/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/shaw/repos/fzf/shell/key-bindings.bash"

