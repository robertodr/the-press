{ system ? builtins.currentSystem }:
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { inherit system; };
in
pkgs.dockerTools.buildImage {
  name = "the-press-latex";
  tag = "latest";
  contents = with pkgs; [
    (
      texlive.combine {
        inherit (texlive)
          collection-basic
          collection-bibtexextra
          collection-binextra
          collection-fontsextra
          collection-fontsrecommended
          collection-fontutils
          collection-langenglish
          collection-langeuropean
          collection-langitalian
          collection-latex
          collection-latexextra
          collection-latexrecommended
          collection-luatex
          collection-mathscience
          collection-pictures
          collection-pstricks
          collection-publishers
          collection-xetex
          ;
      }
    )
  ];
}
