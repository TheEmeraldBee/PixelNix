# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.supportedFilesystems = [ "ntfs" ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  powerManagement.cpuFreqGovernor = "performance";

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        .zen-wrapped
      '';
      mode = "0755";
    };
  };

  # Nvidia drivers are unfree.
  nixpkgs.config.allowUnfree = pkgs.lib.mkForce true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Nvidia Hardware Setup
  services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;

    forceFullCompositionPipeline = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "brighton-pc"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  security.rtkit.enable = true;

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brightonlcox = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;    
  };

  # Chromium and Electron Support
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Programming
    git
    gcc

    # Home Manager
    home-manager

    # Misc
    libnotify
    pulseaudio

    pipewire
    wireplumber

    # TaskBar
    eww

    # Notifications
    mako

    bluez

    # Steam
    steam
    procps
    usbutils

    gamemode

    # ALVR
    alvr
  ] ++ [
    inputs.swww.packages.${pkgs.system}.swww
    inputs.zen-browser.packages.${pkgs.system}.specific
  ];

  hardware.steam-hardware.enable = true;

  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  services.blueman.enable = true;

  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;

    package = pkgs.steam.override {
      extraLibraries = (pkgs: with pkgs; [
        openssl 
        nghttp2 
        libidn2 
        rtmpdump 
        libpsl 
        curl 
        krb5 
        keyutils 
      ]);
    };
  };

  # List services that you want to enable:
  services.openssh.enable = true;

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "brightonlcox" ];
  };


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

