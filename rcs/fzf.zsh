# Setup fzf
# ---------
if [[ ! "$PATH" == */home/shaw/repos/fzf/bin* ]]; then
  export PATH="$PATH:/home/shaw/repos/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/shaw/repos/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/shaw/repos/fzf/shell/key-bindings.zsh"

