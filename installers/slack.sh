#!/bin/bash

SLACK_RESOURCES="/usr/lib/slack/resources/app.asar.unpacked/src/static"

# No blue dot on unread messages in subscribed channels
if [ -d "$SLACK_RESOURCES" ]; then
    if [ ! -f "${SLACK_RESOURCES}/slack-taskbar-unread-backup.png" ]; then
        sudo mv ${SLACK_RESOURCES}/slack-taskbar-unread.png ${SLACK_RESOURCES}/slack-taskbar-unread-backup.png
    fi
    sudo cp ${SLACK_RESOURCES}/slack-taskbar-rest.png ${SLACK_RESOURCES}/slack-taskbar-unread.png
fi
