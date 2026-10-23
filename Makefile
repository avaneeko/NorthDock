COMPOSE := docker compose -f srcs/docker-compose.yml

all: up

up:
	mkdir -p $(VOLUME_MOUNT_DIR)/mariadb
	mkdir -p $(VOLUME_MOUNT_DIR)/wordpress
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs

ps:
	$(COMPOSE) ps

clean: down

fclean:
	$(COMPOSE) down -v
	docker system prune -af

re: fclean
	+$(MAKE) all