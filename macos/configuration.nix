{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
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
      "FelixKratz/formulae" # jankyborders
    ];
    brews = [
      "FelixKratz/formulae/borders"
    ];
    casks = [
      "balenaetcher"
      "zen-browser"
      "raycast"
      "microsoft-teams"
      "nikitabobko/tap/aerospace"

      "postman"

      "utm"

      "obsidian"

      "steam"

      "olympus"

      "1password-cli"
      "1password"
    ];
  };

  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  # Get from darwin-rebuild changelog.
  # Should pretty much never be changed.
  system.stateVersion = 5;
}
