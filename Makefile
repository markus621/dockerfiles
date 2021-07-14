SHELL=/bin/bash

RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
VERSION := $(shell cat ./${RUN_ARGS}/VERSION)

.PHONY: validate
validate:
	@if [ -z "${RUN_ARGS}" ]; then exit 1; fi
	@if [ -z "${VERSION}" ]; then exit 3; fi
	@if [ ! -d "${RUN_ARGS}" ]; then exit 3; fi

.PHONY: build
build: validate
	@cd $(RUN_ARGS) &&\
	docker build -t markus621/$(RUN_ARGS):$(VERSION) . &&\
	docker build -t markus621/$(RUN_ARGS):latest .

.PHONY: publish
publish: validate build
	docker push markus621/$(RUN_ARGS):$(VERSION) &&\
	docker push markus621/$(RUN_ARGS):latest


