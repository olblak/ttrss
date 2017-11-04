.PHONY: build run stop clean

IMAGE = 'olblak/ttrss'
TAG = $(shell git rev-parse HEAD | cut -c1-6)

build:
	docker build -t $(IMAGE):$(TAG) -t $(IMAGE):$(TAG) .

publish: 
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest
run:
	docker-compose up -d web

stop:
	docker-compose stop

clean:
	docker-compose rm -f 
