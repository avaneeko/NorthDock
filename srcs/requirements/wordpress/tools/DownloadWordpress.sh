#!/bin/ash

set -eu

mkdir -p /wordpress /wordpress_source
wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /wordpress_source --strip-components=1
rm /tmp/wordpress.tar.gz