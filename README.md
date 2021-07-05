Readme
======

A personal experiment of structuring a [poetry] python project using both [nix] and [poetry2nix].

[poetry]: https://python-poetry.org/
[nix]: https://nixos.org/guides/install-nix.html
[poetry2nix]: https://github.com/nix-community/poetry2nix


## Requirements

 -  Install [nix].
 -  Optionally install [direnv].

[direnv]: https://direnv.net/

## Usage

### Enter the dev environement and run the app

```bash
$ nix-shell
# ..
```

or alternatively, through [direnv]:

```bash
$ direnv allow
# ..
```

From the above nix env, run the application:

```bash
$ myapp
# ..
```


### Build and run the application

```bash
$ nix-build release.nix
# ...
```

Run the built app:

```bash
$ ./result/bin/myapp
# ..
```

### Entering the boostrap environement

In case something is broken with the poetry env or when initializing
a new projet:

```bash
$ nix-shell release.nix -A shell.bootstrap
# ..
```

From there, one can use poetry to nix to initialize the project, add dependencies,
etc:

```bash
$ poetry init
# ..
$ poetry add requests pillow flask
# ..
$ poetry add --dev ipython
# ..
# Updating packages.
$ poetry update
# ..
```


## Maintenance

### Updating the nixpkgs pin

This repository use a pinned version of [nixpkgs].

The pin is in `.nix/default.nix` (named `nixpkgsSrc`).

Simply:

 -  update the `rev` field with the desired [nixpkgs] revision.
 -  make a minor change to the `sha256` hash field.
 -  attempt entering the nix env again, the approprite hash will be displayed.
    which you should replace the previous `sha256` with.


[nixpkgs]: https://github.com/NixOS/nixpkgs


### Update the poetry2nix pin

The pin is in `.nix/overlay-internal.nix` (named `poetry2nixSrc`).

Same procedure as for `nixpkgs`.


## References

Work baesd on:

 -  [Developing Python with Poetry & Poetry2nix: Reproducible flexible Python environments - Tweag](https://www.tweag.io/blog/2020-08-12-poetry2nix/)

 -  [python-poetry/poetry: Python dependency management and packaging made easy.](https://github.com/python-poetry/poetry#dependency-resolution)

