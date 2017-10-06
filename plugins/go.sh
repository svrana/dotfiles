export GOPATH=~/.gocode
export GOROOT=/usr/local/go

[ ! -d $GOPATH ] && mkdir $GOPATH

alias gopath='echo -e ${GOPATH//:/\\n}'

PATH_append $GOPATH/bin:$GOROOT/bin

function __dotfiles_go_install() {
    local version=1.9.1
    local url=https://storage.googleapis.com/golang
    local filename=go${version}.linux-amd64.tar.gz

    local install=0
    if ! type go > /dev/null 2>&1 ; then
        echo "No go binary found"
        install=1
    elif ! go version | grep -q $version ; then
        echo "Old go binary found"
        install=1
    fi

    install=0

    if [ $install -eq 1 ]; then
        wget "${url}/${filename}" -O "$DOWNLOADS/$filename"
        [ -d /usr/local/go ] && sudo rm -rf /usr/local/go
        sudo tar -C /usr/local -xzf "$DOWNLOADS/$filename"
        rm "$DOWNLOADS/$filename"
    fi
}
