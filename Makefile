
K8S_VERSION=v1.3.0
MINIKUBE_VERSION=v0.8.0
DOCKER_MACHINE_KVM_VERSION=v0.7.0

BINS=bin/kubectl bin/minikube

.PHONY: all
all: snap

.PHONY: snap
snap: $(BINS)
	snapcraft

bin/kubectl: | bin
	curl -Lo $@ https://storage.googleapis.com/kubernetes-release/release/$(K8S_VERSION)/bin/linux/amd64/kubectl
	chmod +x $@

bin/minikube: | bin
	curl -Lo $@ https://storage.googleapis.com/minikube/releases/$(MINIKUBE_VERSION)/minikube-linux-amd64
	chmod +x $@

bin:
	mkdir $@

.PHONY: clean
clean:
	snapcraft clean

.PHONY: bin-clean
bin-clean:
	$(RM) $(BINS)

