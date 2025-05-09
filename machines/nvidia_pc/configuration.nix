{pkgs, ...}: let
  rootPath = ../../.;
in {
  # Enable flakes and the `nix` command
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Import all files that are needed
  imports = [
    ############
    # Packages #
    ############
    # Nixos
    (rootPath + /packages/nixos/packages.nix) # Misc Required Packages for Nixos to run
    (rootPath + /packages/nixos/services.nix) # Enable required services
    (rootPath + /packages/nixos/nvidia.nix)
    (import (rootPath + /packages/nixos/network.nix) {
      hostName = "brighton-pc";
    })

    # Applications
    (rootPath + /packages/applications/steam.nix) # Gaming
    (rootPath + /packages/applications/alvr.nix) # VR
    (rootPath + /packages/applications/1password.nix) # Passwords

    (rootPath + /packages/wayland/hyprland_env.nix)

    # Font
    (rootPath + /packages/fonts.nix)

    ./hardware-configuration.nix
  ];

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "brightonlcox";
      };
      default_session = initial_session;
    };
  };

  hardware.keyboard.zsa.enable = true;

  security.polkit.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Define User Account
  users.users.brightonlcox = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.nushell;
  };

  # Enable ZSH
  programs.zsh.enable = true;

  programs.dconf.enable = true;

  programs.nix-ld.enable = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}
