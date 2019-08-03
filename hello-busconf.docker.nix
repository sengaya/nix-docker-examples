{ dockerTools, callPackage }:

dockerTools.buildLayeredImage {
  name = "hello-busconf-nix";
  tag = "latest";
  created = "now";
  contents = callPackage ./hello-busconf.nix {};
  config.Cmd = [ "/bin/hello-busconf" ];
}
