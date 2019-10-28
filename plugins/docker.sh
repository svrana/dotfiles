#!/bin/bash

function docker-rm-dangling() {
    docker images -qf dangling=true | xargs --no-run-if-empty docker rmi
}

export BUILDUID=$(id -u "$USER")
