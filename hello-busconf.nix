{ stdenv, python3 }:

stdenv.mkDerivation {
  name = "hello-busconf";
  buildInputs = [ (python3.withPackages (ps: [ ps.requests ])) ];
  buildCommand = ''
    mkdir -p $out/bin
    cp ${./hello-busconf} $out/bin/hello-busconf
    patchShebangs $out/bin/hello-busconf
  '';
}
