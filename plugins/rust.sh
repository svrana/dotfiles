export CARGO_PATH=~/.cargo

if [ -d $CARGO_PATH ]; then
    PATH_append $CARGO_PATH/bin
fi
