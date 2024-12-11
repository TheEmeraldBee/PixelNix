{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      # Programming
      git
      gcc

      # Window Manager
      leftwm
      leftwm-config

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
      gamescope

      steamtinkerlaunch

      # ALVR
      alvr
    ]
    ++ [
      inputs.swww.packages.${pkgs.system}.swww
      inputs.zen-browser.packages.${pkgs.system}.specific
      inputs.app-launcher.packages.${pkgs.system}.default

      inputs.nixpkgs-olympus.legacyPackages.${system}.olympus
    ];
}
