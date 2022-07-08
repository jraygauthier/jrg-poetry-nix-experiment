.PHONY: all clean release

all: release

clean:
	rm -f ./result*

release:
	nix-build release.nix

package-poetry-refresh-lockfile:
	poetry lock --no-update
