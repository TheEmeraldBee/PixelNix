{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.google-chrome
    pkgs.firefox
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
