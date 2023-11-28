TOPDIR=$(dir $(lastword $(MAKEFILE_LIST)))

SHELL = /usr/bin/env bash
KUSTOMIZE ?= kustomize

all: kustomize check

.PHONY: kustomize
kustomize:
	$(KUSTOMIZE) build strimzi/zookeeper-mode/clients-kustomize/overlays > strimzi/zookeeper-mode/clients/01-clients.yaml

.PHONY: check
check:
	$(SHELL) uncommitted-changes.sh
