all:
	mkdir -p /home/vboxuser/data/mariadb
	mkdir -p /home/vboxuser/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f srcs/docker-compose.yml down


clean:
	docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af
	rm -rf /home/vboxuser/data/*
re: fclean all