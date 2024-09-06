TOPDIR=$(dir $(lastword $(MAKEFILE_LIST)))

SHELL = /usr/bin/env bash
KUSTOMIZE ?= kustomize

all: kustomize check

.PHONY: kustomize
kustomize:
	$(KUSTOMIZE) build strimzi/main/clients-kustomize/overlays > strimzi/main/clients/01-clients.yaml

.PHONY: check
check:
	$(SHELL) uncommitted-changes.sh
