{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nixpkgs-olympus.legacyPackages.${pkgs.system}.olympus
  ];
}
