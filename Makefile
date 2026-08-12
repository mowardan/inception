all:
	mkdir -p /home/parallels/data/mariadb
	mkdir -p /home/parallels/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down


clean:
	docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af
	rm -rf /home/parallels/data/*
re: fclean all