#!/bin/bash

# unset the SUBDIR variable since it changes the behavior of make here
unset SUBDIR

echo "Configuring ffmpeg"
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH" ./configure \
        --prefix="$PREFIX" \
        --disable-doc \
        --disable-static \
        --enable-shared \
        --disable-stripping \
        --extra-libs=-lpthread \
        --extra-libs=-lm \
        --extra-libs=-lnettle \
        --extra-libs=-lhogweed \
        --extra-libs=-lgmp \
        --enable-gnutls \
        --enable-zlib \
        --enable-gpl \
        --enable-nonfree \
        --enable-version3 \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libvpx \
        --enable-libtheora \
        --enable-cuda \
        --enable-cuvid \
        --enable-nvenc \
        --enable-libnpp \
        --extra-cflags=-I/usr/local/cuda/include \
        --extra-ldflags=-L/usr/local/cuda/lib64


make -j16
make install
