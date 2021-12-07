SHELL=/bin/bash

ARCH := $(shell uname -p)
APP := $(word 2, $(MAKECMDGOALS))
VERSION := $(word 3, $(MAKECMDGOALS))

.PHONY: validate
validate:
	@if [ -z "${APP}" ]; then exit 1; fi
	@if [ -z "${VERSION}" ]; then exit 1; fi
	@if [ ! -d "${APP}/${VERSION}" ]; then exit 1; fi

.PHONY: build
build: validate
	@cd $(APP)/$(VERSION) &&\
	docker buildx build --platform linux/amd64,linux/arm64 --tag markus621/$(APP):$(VERSION) .

.PHONY: publish
publish: validate build
	@cd $(APP)/$(VERSION) &&\
	docker buildx build --push --platform linux/amd64,linux/arm64 --tag markus621/$(APP):$(VERSION) .

.PHONY: publish_latest
publish_latest: publish
	@cd $(APP)/$(VERSION) &&\
	docker buildx build --push --platform linux/amd64,linux/arm64 --tag markus621/$(APP):latest .

# UBUNTU:
# apt-get install qemu qemu-user-static binfmt-support debootstrap -y