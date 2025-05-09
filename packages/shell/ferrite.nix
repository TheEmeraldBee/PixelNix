{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.ferrite.packages.${pkgs.system}.default
  ];
}
