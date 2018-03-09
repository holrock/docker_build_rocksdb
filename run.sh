#!/bin/sh

set -x

prefix=/work/rocksdb

tar xf v1.1.3.tar.gz
cd zstd-1.1.3/
make
PREFIX=$prefix make install

cd ..
cd gflags
./configure --prefix=$prefix
make
make install

export CPATH=$prefix/include
export LIBRARY_PATH=$prefix/lib
cd ..
tar xf v5.10.4.tar.gz
cd rocksdb-5.10.4/
make shared_lib
INSTALL_PATH=/work/rocksdb/ make install-shared
