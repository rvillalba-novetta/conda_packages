#!/bin/bash

cd build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$PREFIX" -DENABLE_SHARED:bool=on ../../source
make -j16
make install
