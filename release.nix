{ pkgs ? null } @ args:

let
  repoRootDir = ./.;
  pkgs = (import (
      repoRootDir + "/.nix/release.nix") {}
    ).ensurePkgs args;
in

with pkgs;

let
  pythonEnv = poetry2nix.mkPoetryEnv {
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
        pythonEnv
        poetry
        gnumake
      ];
      shellHook = ''
        export "PYTHON_DEFAULT_INTERPRETER_PATH=${pythonEnv}/bin/python"
      '';
    };
  };
}
