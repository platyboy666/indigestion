DOCKER_COMPOSE = docker-compose
YML_FILE = srcs/docker-compose.yml
PROJET_NAME = inception

all: up

up:
	$(DOCKER_COMPOSE) -f $(YML_FILE) up -d --build

down:
	$(DOCKER_COMPOSE) -f $(YML_FILE) down

downv:
	$(DOCKER_COMPOSE) -f $(YML_FILE) down -v

start:
	$(DOCKER_COMPOSE) -f $(YML_FILE) start

stop:
	$(DOCKER_COMPOSE) -f $(YML_FILE) stop

restart: stop start

clean: down
	docker system prune -af
	docker volume prune -f
	docker network prune -f

fclean: clean
	sudo rm -rf /home/pkorsako/data/mariadb/* /home/pkorsako/data/wordpress/*

re: fclean all
