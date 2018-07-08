NAME := fikovnik/rstudio

.PHONE: build

build:
	docker build --rm -t $(NAME) .

