.PHONY: all clean release

all: release

clean:
	rm -f ./result*

release:
	nix-build release.nix
