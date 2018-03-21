
MINIKUBE_VERSION=v0.25.0-96-ga000c35

BINS=bin/kubectl bin/minikube bin/docker-machine-driver-kvm2

.PHONY: all
all: snap

.PHONY: snap
snap: $(BINS)
	snapcraft cleanbuild

bin/kubectl: | bin
	curl -Lo $@ https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod +x $@

bin/minikube: | bin
	curl -Lo $@ https://people.canonical.com/~pjdc/minikube/$(MINIKUBE_VERSION)/minikube-linux-amd64
	chmod +x $@

bin/docker-machine-driver-kvm2: | bin
	curl -Lo $@ https://people.canonical.com/~pjdc/minikube/$(MINIKUBE_VERSION)/docker-machine-driver-kvm2
	chmod +x $@

bin:
	mkdir $@

.PHONY: clean
clean:
	snapcraft clean

.PHONY: bin-clean
bin-clean:
	$(RM) $(BINS)

