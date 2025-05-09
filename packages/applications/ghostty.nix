{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.ghostty.packages.${pkgs.system}.default
  ];

  xdg.configFile."ghostty" = {
    source = ./ghostty;
    recursive = true;
  };
}
