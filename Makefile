.PHONY: build

IMAGE = "registry.taco.moe/argo:latest"

build:
	podman build -t ${IMAGE} .

push:
	podman push ${IMAGE}
