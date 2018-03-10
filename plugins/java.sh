#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

if [ -d "$JAVA_HOME" ]; then
    PATH_append "$JAVA_HOME/bin"
fi

if [ -d "$APPS/gradle" ]; then
    PATH_append "$APPS/gradle/bin"
fi

alias classpath='echo -e ${CLASSPATH//:/\\n}'
