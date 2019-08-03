{ pkgs ? import <nixpkgs> {} }:

{ package = pkgs.callPackage ./hello-busconf.nix {};
  docker-image = pkgs.callPackage ./hello-busconf.docker.nix {};
}