NAME := fikovnik/rstudio

.PHONY: build run

build:
	docker build --rm -t $(NAME) .

run:
	if docker ps | grep rstudio 2>&1 > /dev/null; then \
		echo "Already running" \
	elif docker ps -a | grep rstudio 2>&1 > /dev/null; then \
		docker start rstudio \
	else \
		docker run \
			--name rstudio \
			-d \
			-p 8787:8787 \
			-p 3838:3838 \
			-v $(pwd):/home/rstudio \
			-e ADD=shiny \
			fikovnik/rstudio; \
	fi
