alias opsdb-psql='psql opsdb -h 127.0.0.1 -d opsdb'

function opsdb-reload() {
    local load_file
    load_file=$(dolisting "$DOWNLOADS/wish_opsdb_*.sql" | tr ' ' '\n' | sort -nrt _ -k2 | head -1)
    if [ -z "${load_file}" ]; then
        echo "Could not find a opsdb file to load"
        return 1
    fi

    psql -U postgres -h 127.0.0.1 -c 'drop database opsdb'
    psql -U postgres -h 127.0.0.1 -c 'create database opsdb'

    opsdb-psql < "${load_file}"
    return 0
}
