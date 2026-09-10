.PHONY: build run check

IMAGE ?= sgt-gateway

build:
	docker build -t $(IMAGE) .

run: build
	docker run --rm -p 8000:80 $(IMAGE)

check: build
	docker run --rm --entrypoint nginx $(IMAGE) -t
