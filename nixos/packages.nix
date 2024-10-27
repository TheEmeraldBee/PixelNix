{ inputs, pkgs, ... }: {
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
}
