#!/bin/sh
mkdir -p work
docker build -t rocks .
docker run --disable-content-trust -v $PWD/work:/work rocks:latest
