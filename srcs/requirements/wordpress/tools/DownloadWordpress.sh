#!/bin/ash

set -eu

mkdir -p /wordpress /wordpress_source
wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /wordpress_source --strip-components=1
rm /tmp/wordpress.tar.gz
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
    -O /wordpress_source/wp &&\
    chmod +x /wordpress_source/wp