export FZF_DEFAULT_COMMAND='ag -l -g ""'    # ag for showing only interesting files
export FZF_CTRL_T_COMAMAND="$FZF_DEFAULT_COMMAND"

[ -f "$RC_DIR/fzf.bash" ] && . "$RC_DIR/fzf.bash"
