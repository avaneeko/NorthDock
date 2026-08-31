# Install build dependencies
apk add build-base cmake ncurses ncurses-dev gnutls gnutls-dev bzip2 bzip2-dev lz4 lz4-dev xz-libs xz-dev lzo lzo-dev curl curl-dev snappy snappy-dev boost boost-dev libaio libaio-dev

# Download source tar archive.
wget https://mirror.nodesdirect.com/mariadb///mariadb-12.3.2/source/mariadb-12.3.2.tar.gz
tar -xvzf mariadb-12.3.2.tar.gz
rm mariadb-12.3.2.tar.gz
cd mariadb-12.3.2

mkdir build
cd build
# cmake .. -DCMAKE_BUILD_TYPE=Release
cmake .. -DBUILD_CONFIG=mysql_release -DPLUGIN_AUTH_PAM=NO -DPLUGIN_ROCKSDB=NO -DWITH_WSREP=OFF -DPLUGIN_MROONGA=NO -DPLUGIN_SPIDER=NO -DPLUGIN_OQGRAPH=NO -DWITH_UNIT_TESTS=OFF -DWITH_EMBEDDED_SERVER=OFF -DPLUGIN_CONNECT=NO
cmake --build . --parallel $(expr $(nproc) - 1)