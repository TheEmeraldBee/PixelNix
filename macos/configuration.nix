{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  users.users.brightoncox = {
    name = "brightoncox";
    home = "/Users/brightoncox";
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    taps = [];
    brews = [];
    casks = ["zen-browser"];
  };

  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  # Get from darwin-rebuild changelog.
  # Should pretty much never be changed.
  system.stateVersion = 5;
}
