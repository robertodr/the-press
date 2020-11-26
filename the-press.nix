pkgs.dockerTools.buildImage {
  contents = pkgs.hello;
  config.Cmd = [ "/bin/hello" ];
}
