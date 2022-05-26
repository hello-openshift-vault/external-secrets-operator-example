.PHONY: help build-image push-image install uninstall

IMAGE = "registry.taco.moe/argo:latest"

help:
	cat Makefile

build-image:
	podman build -t ${IMAGE} .

push-image:
	podman push ${IMAGE}

install:
	oc create -f my-app-argo.yaml
	sleep 5
	oc create -f application.yaml

uninstall:
	oc delete -f application.yaml
	oc delete -f my-app-argo.yaml
