if [ -d "$APPS/google-cloud-sdk" ]; then
    # Updates PATH for the Google Cloud SDK.
    source "$APPS/google-cloud-sdk/path.bash.inc"
    # Enables shell command completion for gcloud.
    source "$APPS/google-cloud-sdk/completion.bash.inc"
    source <(kubectl completion bash)
fi


