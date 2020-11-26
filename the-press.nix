{ system ? builtins.currentSystem }:
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { inherit system; };
in
pkgs.dockerTools.buildImage {
  name = "the-press";
  contents = with pkgs; [
    git-latexdiff
    haskellPackages.pandoc-citeproc
    haskellPackages.pandoc-crossref
    pandoc
    tectonic
    (
      texlive.combine {
        inherit (texlive)
          collection-basic
          collection-bibtexextra
          collection-binextra
          collection-context
          collection-fontsextra
          collection-fontsrecommended
          collection-fontutils
          collection-formatsextra
          collection-langenglish
          collection-langeuropean
          collection-langfrench
          collection-langitalian
          collection-langother
          collection-latex
          collection-latexextra
          collection-latexrecommended
          collection-luatex
          collection-mathscience
          collection-metapost
          collection-pictures
          collection-plaingeneric
          collection-pstricks
          collection-publishers
          collection-xetex
          ;
      }
    )
    tikzit
  ];
}
