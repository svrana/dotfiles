if [ ! -d "$APPS/update-systemd-resolved" ]; then
    git clone git@github.com:jonathanio/update-systemd-resolved.git ~/Apps/update-systemd-resolved
    pushd ~/Apps/update-systemd-resolved
    sudo make
    popd
fi
