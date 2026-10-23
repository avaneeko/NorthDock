#!/bin/ash
set -eu

if [ ! -d /mariadb_data/mysql ]; then
  /mariadb/scripts/mariadb-install-db --user=root --basedir=/mariadb \
    --datadir=/mariadb_data --skip-test-db
fi

# Issue MariaDB credentials.
umask 077
cat >/tmp/init.sql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

exec /mariadb/bin/mariadbd \
   --user=root \
   --datadir=/mariadb_data \
   --bind-address=0.0.0.0 \
   --init-file=/tmp/init.sql