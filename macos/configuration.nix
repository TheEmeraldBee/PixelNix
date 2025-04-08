{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../packages/postgres.nix
  ];

  users.users.brightoncox = {
    name = "brightoncox";
    home = "/Users/brightoncox";
    shell = pkgs.nushell;
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
      "homebrew/services"
    ];
    brews = [
      "FelixKratz/formulae/borders"
      "mysql"
      "ollama"
      "npm"
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

      "godot"

      "docker"

      "ghostty"

      "mysqlworkbench"

      "1password-cli"
      "1password"

      "firefox"

      "whisky"
    ];
  };

  nix.settings.experimental-features = "nix-command flakes";

  # Get from darwin-rebuild changelog.
  # Should pretty much never be changed.
  system.stateVersion = 5;
}
