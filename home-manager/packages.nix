{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs;
    [
      gnumake

      hypridle
      hyprlock

      # Screenshots
      grim
      slurp

      feh

      # ------------ #
      # Applications #
      # ------------ #

      # Programming
      godot_4

      # Audio Editor
      pavucontrol

      # Mods
      nexusmods-app-unfree

      # Keyboard
      wally-cli

      # ------------------- #
      # Password Management #
      # ------------------- #
      _1password-gui
      _1password-cli
    ]
    ++ [
      inputs.ghostty.packages.${pkgs.system}.default
    ];
}
