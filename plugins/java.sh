#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/default-java

if [ -d "$JAVA_HOME" ]; then
    PATH_append "$JAVA_HOME/bin"
fi

if [ -d "$APPS/gradle" ]; then
    PATH_append "$APPS/gradle/bin"
fi

alias classpath='echo -e ${CLASSPATH//:/\\n}'
