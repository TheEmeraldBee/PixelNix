{
  inputs,
  config,
  libs,
  pkgs,
  ...
}: {
  news.display = "silent";

  # Define Normal Home Modules
  home = {
    username = "brightonlcox";
    homeDirectory = "/home/brightonlcox";
    stateVersion = "24.11";
  };

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
  };

  imports = [
    ../shared/packages.nix # Contains shared applications between machines.
    ./packages.nix # Contains applications specific to this machine.

    # Theme the required applications
    ./theme.nix

    ../packages/dunst.nix

    # Programs
    ../packages/ghostty.nix

    # AI Chat!
    ../packages/aichat.nix

    # Helix
    ../packages/helix.nix
    ../packages/zellix.nix

    # Shell
    (import ../shared/shell.nix {
      additionalConfig = "$env.PATH = ($env.PATH | split row esep | prepend /run/wrappers/bin)";
    })
    ../packages/git.nix
    ../packages/zellij.nix
    ../packages/starship.nix

    ../packages/jujutsu.nix

    # For File Exploring
    ../packages/yazi.nix

    # Applications
    ../packages/app-launcher.nix

    # Home Manager
    ../packages/hyprland.nix
  ];
}
