.PHONY: help build-image push-image install uninstall

IMAGE = "registry.taco.moe/argo:latest"

help:
	cat Makefile

build-image:
	podman build -t ${IMAGE} .

push-image:
	podman push ${IMAGE}

install:
	oc create -f ./manifests/01-vault-config.yaml
	sleep 20
	oc create -f ./manifests/02-vault-role.yaml
	sleep 10
	oc create -f ./manifests/03-namespace.yaml
	oc create -f ./manifests/04-argocd.yaml
	sleep 30
	oc create -f ./manifests/05-application.yaml
	echo 'Done!'

uninstall:
	oc delete -f manifests
