filename="keybase_amd64.deb"

if [ ! -f "$APPS/${filename}" ]; then
    curl -sSf -o "$APPS/keybase_amd64.deb" -O https://prerelease.keybase.io/keybase_amd64.deb
    sudo dpkg -i "$APPS/$filename"
    sudo apt-get install -f
    run_keybase
fi
