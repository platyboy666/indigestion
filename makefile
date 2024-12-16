DOCKER_COMPOSE = docker-compose
YML_FILE = srcs/docker-compose.yml
PROJET_NAME = inception

all: up

up:
	$(DOCKER_COMPOSE) -f $(YML_FILE) up -d --build

down:
	$(DOCKER_COMPOSE) -f $(YML_FILE) down

start:
	$(DOCKER_COMPOSE) -f $(YML_FILE) start

stop:
	$(DOCKER_COMPOSE) -f $(YML_FILE) stop

restart: stop start

clean: down
	docker system prune -af
	docker network prune -f

fclean: clean
	sudo rm -rf /home/pkorsako/data/web/* /home/pkorsako/data/database/*

re: fclean all
