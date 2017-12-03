#!/bin/bash

export JAVA_HOME=$APPS/java

if [ -d "$JAVA_HOME" ]; then
    PATH_append "$JAVA_HOME/bin"
fi

alias classpath='echo -e ${CLASSPATH//:/\\n}'
