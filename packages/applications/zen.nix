{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.firefox
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
