{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    lix

    # Home Manager
    home-manager

    # Misc
    libnotify
    pulseaudio

    pipewire
    wireplumber

    bluez
  ];
}
