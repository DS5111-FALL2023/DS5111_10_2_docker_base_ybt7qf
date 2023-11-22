default:
	@cat makefile

# This command should build the image on your local machine
.PHONY: build
build:
	docker build -t knn_iris .

# this will create a container from the image and run it
.PHONY: run
run:
	docker run knn_iris

# this will start a bash session inside the container, so you can verify the image was created
.PHONY: interbash
interbash:
	docker run -it knn_iris /bin/bash

# login to dockerhub
.PHONY: login
login:
	docker login -u dscerbo

# tag image before pushing to dockerhub
.PHONY: tag
tag:
	docker tag knn_iris:latest dscerbo/knn_iris:v0.0.1

# now push your image to dockerhub
.PHONY: push
push:
	docker push dscerbo/knn_iris:v0.0.1

.PHONY: clean_containers
clean_containers:
	docker ps -aq | xargs docker stop | xargs docker rm

.PHONY: clean_images
	docker rmi $(docker images -a -q)
