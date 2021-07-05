{ pkgs ? null} @ args:

let
  pkgs = (import ./.nix/default.nix {}).ensurePkgs args;
in

with pkgs;

poetry2nix.mkPoetryApplication {
  projectDir = ./.;
}