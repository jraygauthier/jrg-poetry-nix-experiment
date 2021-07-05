{ pkgs ? null } @ args:

let
  repoRootDir = ./.;
  pkgs = (import (
      repoRootDir + "/.nix/release.nix") {}
    ).ensurePkgs args;
in

with pkgs;

let
  imageappEnv = poetry2nix.mkPoetryEnv {
    python = python38;
    projectDir = ./.;
    editablePackageSources = {
        myapp = ./myapp;
    };
  };
in

{
  default = poetry2nix.mkPoetryApplication {
    projectDir = ./.;
  };

  shell = {
    bootstrap = pkgs.mkShell {
      buildInputs = [
        python3
        poetry
      ];
    };

    dev = mkShell {
      buildInputs = [
        imageappEnv
        poetry
        gnumake
      ];
      shellHook = ''
      '';
    };
  };
}
