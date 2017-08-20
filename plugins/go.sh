export GOPATH=~/.gocode
export GOROOT=/usr/local/go

if [ ! -d $GOPATH ]; then
    mkdir $GOPATH
fi


alias gopath='echo -e ${GOPATH//:/\\n}'

PATH_append $GOPATH/bin:$GOROOT/bin
