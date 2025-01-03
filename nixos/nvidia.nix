{
  config,
  lib,
  pkgs,
  ...
}: {
  # Chromium and Electron Support
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Nvidia Hardware Setup
  services.xserver.videoDrivers = lib.mkForce ["nvidia"];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [libva];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    # forceFullCompositionPipeline = true;

    prime = {
      sync.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
