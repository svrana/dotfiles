command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell bash)"
# prevents virtualgo from auto-activating; leave that to direnv
export PROMPT_COMMAND=$_VIRTUALGO_ORIGINAL_PROMPT_COMMAND
