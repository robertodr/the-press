{ system ? builtins.currentSystem }:
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { inherit system; };
in
pkgs.dockerTools.buildImage {
  name = "the-press-pandoc";
  tag = "latest";
  contents = with pkgs; [
    haskellPackages.pandoc-citeproc
    haskellPackages.pandoc-crossref
    pandoc
  ];
}
