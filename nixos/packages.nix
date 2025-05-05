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

      # Home Manager
      home-manager

      # Misc
      libnotify
      pulseaudio

      pipewire
      wireplumber

      # TaskBar
      eww

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
      inputs.zen-browser.packages.${pkgs.system}.default
      inputs.app-launcher.packages.${pkgs.system}.default

      inputs.nixpkgs-olympus.legacyPackages.${system}.olympus
    ];
}
