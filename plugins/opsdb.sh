#!/bin/bash

alias opsdb-psql='psql opsdb -h 127.0.0.1 -d opsdb'
alias web6='cd ~/.go/src/github.com/ghowland/web6.0'
alias yudien='cd ~/.go/src/github.com/ghowland/yudien'

function opsdb-reload() {
    local load_file
    load_file=$(dolisting "$DOWNLOADS/wish_opsdb_*.sql" | tr ' ' '\n' | sort -nrt _ -k2 | head -1)
    if [ -z "${load_file}" ]; then
        echo "Could not find a opsdb file to load"
        return 1
    fi

    if ! psql -U postgres -h 127.0.0.1 -c 'drop database opsdb' ; then
        echo "Failed to drop opsdb database"
        return 1
    fi
    if ! psql -U postgres -h 127.0.0.1 -c 'create database opsdb' ; then
        echo "Failed to create opsdb database"
        return 1
    fi

    opsdb-psql < "${load_file}"
    return 0
}

function opsdb-dump() {
    pg_dump --username=opsdb --dbname=opsdb --host=localhost > opsdb.dump
}
