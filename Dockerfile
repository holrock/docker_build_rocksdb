FROM centos:7

RUN yum -y update && yum -y install snappy snappy-devel zlib zlib-devel z4-devel gcc-c++ make git which && \
    git clone --branch v2.0 --depth 1  https://github.com/gflags/gflags.git && \
    cd gflags && ./configure && make && make install && \
    cd .. && curl -L -O https://github.com/facebook/zstd/archive/v1.1.3.tar.gz && \
    tar xf v1.1.3.tar.gz && cd zstd-1.1.3/ && make && make install && \
    cd .. && curl -L -O https://github.com/facebook/rocksdb/archive/v5.10.4.tar.gz

#tar xf v5.10.4.tar.gz && cd rocksdb-5.10.4/ && make shared_lib && INSTALL_PATH=/work/rocksdb/ make install-shared

CMD tar xf v5.10.4.tar.gz && cd rocksdb-5.10.4/ && make shared_lib && INSTALL_PATH=/work/rocksdb/ make install-shared
