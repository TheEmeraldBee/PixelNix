{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Pretty Borders!
    ../packages/jankyborders.nix
  ];

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

    taps = [
      "nikitabobko/tap" # aerospace
    ];
    brews = [];
    casks = [
      "zen-browser"
      "raycast"
      "microsoft-teams"
      "nikitabobko/tap/aerospace"
    ];
  };

  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  # Get from darwin-rebuild changelog.
  # Should pretty much never be changed.
  system.stateVersion = 5;
}
