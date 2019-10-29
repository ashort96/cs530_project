#!/usr/bin/env bash

git submodule init
git submodule update
git submodule add -f https://github.com/google/googletest.git benchmark/googletest
mkdir benchmark/build
cd benchmark/build && cmake -DCMAKE_BUILD_TYPE=Release ../
make -j8
