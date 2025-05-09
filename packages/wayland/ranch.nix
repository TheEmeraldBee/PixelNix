{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.ranch.packages.${pkgs.system}.default
  ];
  xdg.configFile."ranch" = {
    source = ./ranch;
    recursive = true;
  };
}
