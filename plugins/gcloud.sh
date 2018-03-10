#!/bin/bash

if [ -d "$APPS/google-cloud-sdk" ]; then
    #source "$APPS/google-cloud-sdk/path.bash.inc"
    PATH_append "$APPS/google-cloud-sdk/bin"
    # Enables shell command completion for gcloud.
    source "$APPS/google-cloud-sdk/completion.bash.inc"
fi


