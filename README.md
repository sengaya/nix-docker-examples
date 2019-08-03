# Building Docker Images with Nix

Prerequisites:
- [NixOS](https://nixos.org/) installed with docker

## One-liner to create a docker image with a set of nix packages
```
docker load --input $(nix-build -E 'with import <nixpkgs> {}; pkgs.dockerTools.buildLayeredImage { name = "cowsay-docker-oneliner"; tag = "latest"; contents = pkgs.cowsay; config = { Cmd = [ "/bin/cowsay" "Hello BusConf!" ]; }; }')
docker run --rm cowsay-docker-oneliner
```

## Simple example with cowsay
```
nix-build cowsay-docker.nix
docker load < result
docker run --rm cowsay-nix
```

## Example with python
This example will build a docker image that runs the python script `hello-busconf` with the help of:
- `hello-busconf.nix` - build the nix package, inclduing python dependencies
- `hello-busconf.docker.nix` - build the docker image
- `default.nix` - build both
```
nix-build
docker load < result
docker run --rm hello-busconf-nix
```

## Related links
- https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/examples.nix
- https://grahamc.com/blog/nix-and-layered-docker-images
- https://github.com/wagoodman/dive
- https://gitlab.com/zimbatm/docker-nixpkgs
- https://github.com/google/nixery
