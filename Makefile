all:	build

build:
	@mkdir -p /home/${USER}/data/db
	@mkdir -p /home/${USER}/data/wp
	@mkdir -p /home/${USER}/data/backup
	@docker-compose -f srcs/docker-compose.yml build

up:
	@docker-compose -f srcs/docker-compose.yml up

down:
	@docker-compose -f srcs/docker-compose.yml down

ps:
	@docker-compose -f srcs/docker-compose.yml ps

fclean:	down
	@docker rmi -f $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker system prune -af
	sudo rm -rf /home/${USER}/data/

re: fclean all

.PHONY:	all up down ps fclean re