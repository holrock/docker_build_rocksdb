FROM centos:7

RUN yum -y update && yum -y install snappy snappy-devel zlib zlib-devel z4-devel gcc-c++ make git which && \
    git clone --branch v2.0 --depth 1  https://github.com/gflags/gflags.git && \
    curl -L -O https://github.com/facebook/zstd/archive/v1.1.3.tar.gz && \
    curl -L -O https://github.com/facebook/rocksdb/archive/v5.10.4.tar.gz

COPY run.sh /
CMD ./run.sh
