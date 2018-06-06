.PHONY: all
all: snap

.PHONY: snap
snap:
	snapcraft cleanbuild

bin:
	mkdir $@

.PHONY: clean
clean:
	snapcraft clean

