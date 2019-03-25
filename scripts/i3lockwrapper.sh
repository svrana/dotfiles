#!/bin/bash

# save current workspace
current=$(i3-msg -t get_workspaces \
  | jq '.[] | select(.focused==true).name' \
  | cut -d"\"" -f2)
# go to empty workspace
i3-msg workspace 7

# startup lock, blocking until unlocked
i3-msg workspace 7 && i3-msg workspace 7 && i3lock -c 002b36 --ignore-empty-password --no-unlock-indicator --clock --nofork

# go to previous workspace
i3-msg workspace "$current"