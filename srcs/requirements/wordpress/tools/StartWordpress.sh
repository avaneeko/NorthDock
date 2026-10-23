#!/bin/ash

set -euo pipefail

cd /wordpress

# Spin until mariadb is online and reachable.
until mariadb -h mariadb -u"$MARIADB_USER" -p"$MARIADB_PASSWORD" \
        --skip-ssl -e 'SELECT 1' "$MARIADB_DATABASE" >/dev/null 2>&1
do
    echo 'Waiting for MariaDB.'
    sleep 1
done

! cat ./wp-load.php >/dev/null 2>&1 &&\
    cp -r /wordpress_source /wordpress

! cat ./wp-config.php 2>&1 &&\
    wp config create \
    --dbname="$MARIADB_DATABASE" \
    --dbuser="$MARIADB_USER" \
    --dbpass="$MARIADB_PASSWORD" \
    --dbhost="mariadb:3306" \
    --allow-root &&\
    echo 'Created Wordpress config.'

! cat ./wp-config.php 2>&1 &&\
    echo 'Failed to create Wordpress config.' &&\
    exit 1

! wp core is-installed --allow-root >/dev/null 2>&1 &&\
    wp core install \
        --url="https://$DOMAIN_NAME" \
        --title="Inception" \
        --admin_user="$WORDPRESS_ADMIN_USER" \
        --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
        --admin_email="$WORDPRESS_ADMIN_EMAIL" \
        --skip-email \
        --allow-root &&\
    echo 'Installed Wordpress.'

! wp core is-installed --allow-root >/dev/null 2>&1 &&\
    echo 'Failed to install Wordpress.' &&\
    exit 1