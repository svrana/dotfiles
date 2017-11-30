#!/bin/bash

function docker_rm_dangling() {
    docker images -qf dangling=true | xargs --no-run-if-empty docker rmi
}

