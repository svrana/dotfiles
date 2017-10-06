export GOPATH=~/.gocode
export GOROOT=/usr/local/go

[ ! -d $GOPATH ] && mkdir $GOPATH

alias gopath='echo -e ${GOPATH//:/\\n}'

PATH_append $GOPATH/bin:$GOROOT/bin

function __dotfiles_go_install() {
    [ -d $GOROOT ] && return 0

    local version=1.9.1
    local url=https://storage.googleapis.com/golang
    local filename=go${version}.linux-amd64.tar.gz

    wget "${url}/${filename}" -O "$DOWNLOADS/$filename"
    sudo tar -C /usr/local -xzf "$DOWNLOADS/$filename" && \
        rm "$DOWNLOADS/$filename"
}
