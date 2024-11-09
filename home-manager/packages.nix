{pkgs, ...}: {
  home.packages = with pkgs; [
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
