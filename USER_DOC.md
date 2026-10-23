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