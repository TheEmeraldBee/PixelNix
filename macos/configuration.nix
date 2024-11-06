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
    brews = [ "cowsay" ];
    casks = [];
  };

  services.nix-daemon.enable = true;

  # Enable Unfree Packages
  nixpkgs.config.allowUnfree = pkgs.lib.mkForce true;

  nix.settings.experimental-features = "nix-command flakes";

  # Get from darwin-rebuild changelog.
  # Should pretty much never be changed.
  system.stateVersion = 5;
}
