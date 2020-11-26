{ system ? builtins.currentSystem }:
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { inherit system; };
in
pkgs.dockerTools.buildImage {
  name = "docker.pkg.github.com/robertodr/the-press/the-press";
  contents = pkgs.hello;
  config.Cmd = [ "/bin/hello" ];
}
