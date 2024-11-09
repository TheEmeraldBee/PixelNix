{pkgs, ...}: {
  home.packages = with pkgs; [
    hypridle
    hyprlock

    # Screenshots
    grim
    slurp

    feh

    # ------------ #
    # Applications #
    # ------------ #

    # Audio Editor
    pavucontrol

    # ------------------- #
    # Password Management #
    # ------------------- #
    _1password-gui
    _1password
  ];
}
