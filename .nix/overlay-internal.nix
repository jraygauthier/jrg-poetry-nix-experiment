{ srcs
, pickedSrcs
}:
self: super:

let
  poetry2nixSrc = builtins.fetchTarball {
    # v1.17.1
    url = "https://github.com/nix-community/poetry2nix//archive/92350882edf748248c5fc59e0721bf8c192bec58.tar.gz";
    sha256 = "0p4a6y08af5hxpa6l4gf08xkvz3z8x7cs2cvkp3694plbc0as9qk";
  };
in

{
  poetry2nix = self.callPackage poetry2nixSrc {
    pkgs = self;
    lib = self.lib;
  };
}
