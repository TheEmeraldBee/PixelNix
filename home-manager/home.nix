{ config, libs, pkgs, ...}: {
  # Enable Unfree Packages
  nixpkgs.config.allowUnfree = pkgs.lib.mkForce true;

  # Define Normal Home Modules
  home = {
    username = "brightonlcox";
    homeDirectory = "/home/brightonlcox";
    stateVersion = "24.11";

    sessionPath = [
      # Put ~/.cargo/bin into my PATH
      "/home/brightonlcox/.cargo/bin"
    ];
  };

  imports = [
    # All package installations defined here.
    ./packages.nix

    # Theme the required applications
    ./theme.nix

    # Programs
    ./alacritty.nix

    # Shell
    ./shell.nix
    ./git.nix
    ./zellij.nix
    ./starship.nix

    # Home Manager
    ./hyprland.nix
  ];
}

