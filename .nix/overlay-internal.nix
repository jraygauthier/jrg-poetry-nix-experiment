{ srcs
, pickedSrcs
}:
self: super:

let
  poetry2nixSrc = builtins.fetchTarball {
    # v1.29.1
    url = "https://github.com/nix-community/poetry2nix//archive/88ffae91c605aaafc2797f4096ca9f065152796a.tar.gz";
    sha256 = "0iq9jlzz92r3ax1ymg00cn4s8c1wi3jgh1693abyyn0baq7gixrb";
  };
in

{
  poetry2nix = self.callPackage poetry2nixSrc {
    pkgs = self;
    lib = self.lib;
  };
}
