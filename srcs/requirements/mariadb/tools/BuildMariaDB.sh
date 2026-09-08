# Install build dependencies
apk add build-base cmake bash ncurses-dev gnutls-dev bzip2-dev lz4-dev xz-dev lzo-dev curl-dev snappy-dev boost-dev libaio-dev

# Download source tar archive.
wget https://mirrors.accretive-networks.net/mariadb///mariadb-12.3.3/source/mariadb-12.3.3.tar.gz
tar -xvzf mariadb-12.3.3.tar.gz
rm mariadb-12.3.3.tar.gz
cd mariadb-12.3.3

mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/mariadb -DBUILD_CONFIG=mysql_release -DPLUGIN_AUTH_PAM=NO -DPLUGIN_ROCKSDB=NO -DWITH_WSREP=OFF -DPLUGIN_MROONGA=NO -DPLUGIN_SPIDER=NO -DPLUGIN_OQGRAPH=NO -DWITH_UNIT_TESTS=OFF -DWITH_EMBEDDED_SERVER=OFF -DPLUGIN_CONNECT=NO
cmake --build . --parallel $(expr $(nproc) - 1)
cmake --install .