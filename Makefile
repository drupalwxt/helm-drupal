NAME := drupalwxt/helm-drupal
VERSION := $(or $(VERSION),$(VERSION),'latest')
PLATFORM := $(shell uname -s)

all: lint

lint:
	./test/lint.sh

.PHONY: \
	all \
	lint
