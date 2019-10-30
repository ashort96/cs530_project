#!/usr/bin/env bash

if [ "$1" == "DOCKER" ]; then
    git init
    git submodule add -f https://github.com/google/benchmark.git
    git submodule add -f https://github.com/google/googletest.git benchmark/googletest

else
    git submodule init
    git submodule update
    git submodule add -f https://github.com/google/googletest.git benchmark/googletest
fi

mkdir benchmark/build
cd benchmark/build && cmake -DCMAKE_BUILD_TYPE=Release ../
make -j8

if [ "$1" == "DOCKER" ]; then
    cd /usr/src/app
    make run
fi
