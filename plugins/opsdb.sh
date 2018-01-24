#!/bin/bash

alias opsdb-psql='psql opsdb -h 127.0.0.1 -d opsdb'
alias web6='cd ~/.go/src/github.com/ghowland/web6.0'
alias yudien='cd ~/.go/src/github.com/ghowland/yudien'

function opsdb-reload() {
    local load_file

    if [ -z "$1" ]; then
        load_file=$(dolisting "$DOWNLOADS/wish_opsdb_*.sql" | tr ' ' '\n' | sort -nrt _ -k2 | head -1)
    else
        load_file="$1"
        if [ ! -f "$load_file" ]; then
            echo "Could not find $load_file"
            return 1
        fi
    fi

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

function opsdb-schema-regen() {
    local dir="$HOME/go/src/github.com/jacksontj/dataman/src/"

    if [ ! -d "$dir" ]; then
        echo -n "Fetching schemaexport"
        go get github.com/jacksontj/dataman/src/schemaexport
        estatus
    fi
    pushd "$dir/schemaexport"

    if [ ! -x "$dir/schemaexport" ]; then
        echo -n "Building schemaexport"
        go build
        estatus
    fi

    echo -n "Running schemaexport on opsdb"
    ./schemaexport --databases=opsdb > ~/go/src/github.com/ghowland/web6.0/data/schema.json
    estatus

    popd
}
