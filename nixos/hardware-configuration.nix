# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Enable Windows File System Support
  boot.supportedFilesystems = ["ntfs"];

  # Request performant cpu usage
  powerManagement.cpuFreqGovernor = "performance";

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = ["nvidia" "i915" "nvidia-modeset" "nvidia_uvm" "nvidia_drm"];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  # Enable specific nvidia settings in kernel
  # boot.kernelParams = ["nvidia-drm.fbdev=1" "nvidia-drm.modeset=1"];

  # Define Enabled File Systems
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ccaf0b00-1872-44a7-84aa-2e2f06ba3db6";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C3EC-96A9";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
