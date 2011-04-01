#!/bin/bash
set -e -x

ROOT=${NACL_TOOLCHAIN_ROOT:-$HOME/root/nacl-sdk}
PATH=$ROOT/bin:$ROOT/nacl64/usr/bin:$PATH

export SDL_LIBS="-L$ROOT/nacl64/usr/lib -lSDL -lppapi_cpp -lpthread -lm"
CC=nacl64-gcc AR=nacl64-ar RANLIB=nacl64-ranlib PKG_CONFIG_LIBDIR=$ROOT/nacl64/usr/lib/pkgconfig \
  ./configure --host=nacl64 --prefix=$ROOT/nacl64/usr --disable-music-flac --disable-music-mod --disable-music-mp3
make
make install

