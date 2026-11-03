# Instructions
Use `make` to control the deployment, bring up and shutdown of the application services.
Available make commands:
all - Alias of `up` (Default command if `make` is run without any arguments.)
up - Bring the containers up, builds the images if they're not cached and starts the container.
down - Stops and deletes the containers, networks, volumes.
start - Starts existing containers of the service.
stop - Stops the existing containers of the service.
restart - Restarts the existing containers of the service.
logs - View logs.
ps - View running containers.
clean - Alias of `down`.
fclean - Stops and deletes the containers, networks, volumes and named volumes and
destroys _all_ currently unused Docker state on disk.
re - Chained `fclean` and `up`. Destroys _all_ currently unused Docker state on disk.

To access the website, go to https://login.42.fr
To access the admin panel, go to https://login.42.fr/wp-admin

# Basic checks
To see if there's anything in the database, use the following command to access the database console:
docker compose exec mariadb /mariadb/bin/mariadb -u$MARIADB_USER -p$MARIADB_PASSWORD
Once in console, type
USE $MARIADB_DATABASE;
SHOW TABLES;
To see that the database has tables in it, which signifies that it's not empty. You can view
tables' contents with SELECT. Please note that once in SQL console, you have to type the database
name manually, since it's not a regular shell.

# Credentials
Managed by .env in srcs/ (Not part of the repository because it contains secrets)