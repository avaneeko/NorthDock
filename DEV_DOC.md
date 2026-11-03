There are 3 containers that power the application:
MariaDB - Running on the default port 3306. This container is built from source,
so expect to take quite a while to build from zero on a low-end machine.
Nginx - Running on the default HTTPS port of 443. This is the only port that is exposed to the
outside of the Docker compose.
Wordpress - Blog powered by php-fpm running on the default port 9000.

To run the application, following environmental variables must be setup:
DOMAIN_NAME=login.42.fr

# MariaDB
MARIADB_USER=PlaceholderMariaDBUsername
MARIADB_PASSWORD=PlaceholderMariaDBPassword
MARIADB_ROOT_PASSWORD=PlaceholderMariaDBRootPassword
MARIADB_DATABASE=PlaceholderMariaDBDatabaseName

# Wordpress Admin account
WORDPRESS_ADMIN_USER=PlaceholderWordpressAdminUser
WORDPRESS_ADMIN_PASSWORD=PlaceholderWordpressAdminPassword
WORDPRESS_ADMIN_EMAIL=PlaceholderWordpressAdminEmail@42.fr

# Wordpress User account
WORDPRESS_USER=PlaceholderWordpressUser
WORDPRESS_USER_PASSWORD=PlaceholderWordpressUserPassword
WORDPRESS_USER_EMAIL=PlaceholderWordpressUserEmail@42.fr

# Volume mount directory
VOLUME_MOUNT_DIR=./volume

Docker compose expects (and these are created by the Makefile assuming the VOLUME_MOUNT_DIR is set.)
$(VOLUME_MOUNT_DIR)/mariadb - Bind mount for the MariaDB.
$(VOLUME_MOUNT_DIR)/wordpress - Bind mount for the Wordpress.
These two bind mounts are mandatory for the service to be able to persist blog data across container
lifetimes.

Here are the aliases to trigger bring up and recompilation of specfic containers.
These are useful whenever you're making changes to any of the containers.
alias DCU='docker compose up'
alias DCB-WP='docker compose build wordpress'
alias DCB-MD='docker compose build mariadb'
alias DCB-NG='docker compose build nginx'

# Basic checks
To see if there's anything in the database, use the following command to access the database console:
docker compose exec mariadb /mariadb/bin/mariadb -u$MARIADB_USER -p$MARIADB_PASSWORD
Once in console, type
USE $MARIADB_DATABASE;
SHOW TABLES;
To see that the database has tables in it, which signifies that it's not empty. You can view
tables' contents with SELECT. Please note that once in SQL console, you have to type the database
name manually, since it's not a regular shell.