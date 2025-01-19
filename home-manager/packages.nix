{pkgs, ...}: {
  home.packages = with pkgs; [
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

    # ------------------- #
    # Password Management #
    # ------------------- #
    _1password-gui
    _1password
  ];
}
