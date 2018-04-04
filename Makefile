
BINS=bin/kubectl

.PHONY: all
all: snap

.PHONY: snap
snap: $(BINS)
	snapcraft cleanbuild

bin/kubectl: | bin
	curl -Lo $@ https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod +x $@

bin:
	mkdir $@

.PHONY: clean
clean:
	snapcraft clean

.PHONY: bin-clean
bin-clean:
	$(RM) $(BINS)

