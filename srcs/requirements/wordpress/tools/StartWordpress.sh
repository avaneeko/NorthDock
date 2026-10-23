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

if [ ! -f ./wp-load.php ]; then
    cp -a /wordpress_source/. /wordpress/
fi

# ! cat ./wp-load.php >/dev/null 2>&1 &&\
#     cp -r /wordpress_source /wordpress

if [ ! -f ./wp-config.php ]; then
    /wordpress/wp config create \
    --dbname="$MARIADB_DATABASE" \
    --dbuser="$MARIADB_USER" \
    --dbpass="$MARIADB_PASSWORD" \
    --dbhost="mariadb:3306" \
    --allow-root
    echo 'Created Wordpress config.'
fi

# ! cat ./wp-config.php 2>&1 &&\
#     /wordpress/wp config create \
#     --dbname="$MARIADB_DATABASE" \
#     --dbuser="$MARIADB_USER" \
#     --dbpass="$MARIADB_PASSWORD" \
#     --dbhost="mariadb:3306" \
#     --allow-root &&\
#     echo 'Created Wordpress config.'

# ! cat ./wp-config.php 2>&1 &&\
#     echo 'Failed to create Wordpress config.' &&\
#     exit 1

if ! /wordpress/wp core is-installed --allow-root >/dev/null 2>&1; then
    /wordpress/wp core install \
        --url="https://$DOMAIN_NAME" \
        --title="Inception" \
        --admin_user="$WORDPRESS_ADMIN_USER" \
        --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
        --admin_email="$WORDPRESS_ADMIN_EMAIL" \
        --skip-email \
        --allow-root
    echo 'Installed Wordpress.'
fi

# ! /wordpress/wp core is-installed --allow-root >/dev/null 2>&1 &&\
#     /wordpress/wp core install \
#         --url="https://$DOMAIN_NAME" \
#         --title="Inception" \
#         --admin_user="$WORDPRESS_ADMIN_USER" \
#         --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
#         --admin_email="$WORDPRESS_ADMIN_EMAIL" \
#         --skip-email \
#         --allow-root &&\
#     echo 'Installed Wordpress.'

# ! /wordpress/wp core is-installed --allow-root >/dev/null 2>&1 &&\
#     echo 'Failed to install Wordpress.' &&\
#     exit 1

# Issue normal user credentials.
if ! wp user get "$WORDPRESS_USER" --allow-root >/dev/null 2>&1; then
    wp user create "$WORDPRESS_USER" "$WORDPRESS_USER_EMAIL" \
        --role=author \
        --user_pass="$WORDPRESS_USER_PASSWORD" \
        --allow-root
fi