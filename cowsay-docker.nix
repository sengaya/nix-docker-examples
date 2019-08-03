{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildLayeredImage {
  name = "cowsay-nix";
  tag = "latest";
  contents = pkgs.cowsay;
  config.Cmd = [ "/bin/cowsay" "Hello BusConf!" ];
}
