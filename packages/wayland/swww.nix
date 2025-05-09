{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.swww.packages.${pkgs.system}.swww
  ];
}
