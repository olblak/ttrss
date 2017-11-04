.PHONY: build run stop clean

DOCKER_REPOSITORY = olblak
IMAGE_TAG = $(shell git rev-parse HEAD | cut -c1-6)

build:
	docker build -t $(DOCKER_REPOSITORY)/ttrss:$(IMAGE_TAG) -t $(DOCKER_REPOSITORY)/ttrss:latest .

publish: 
	docker push $(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_NAME):latest
run:
	docker-compose up -d web

stop:
	docker-compose stop

clean:
	docker-compose rm -f 
