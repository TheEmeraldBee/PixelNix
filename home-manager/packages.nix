{ config, libs, pkgs, ...}: {
  home.packages = with pkgs; [
    # ----- #
    # Shell #
    # ----- #
    zsh
    oh-my-zsh

    # ------------------ #
    # Command Line Tools #
    # ------------------ #

    # Editor
    helix

    # Tools
    bacon

    # Desktop Replacements
    htop

    # CLI Theming
    starship

    # Replacements
    zoxide
    eza

    # Multiplexing
    zellij

    # Misc
    wget
    gnutar
    fzf
    gitui

    # Screenshots
    grim
    slurp

    feh

    # ------------ #
    # Applications #
    # ------------ #

    # File-Explorer
    dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg

    # Audio Editor
    pavucontrol

    # Terminal
    alacritty

    # Communication
    discord

    # Gaming
    steam
    osu-lazer

    libsForQt5.kdeconnect-kde

    # ----------- #
    # Programming #
    # ----------- #

    # Python
    python3Full
    uv
    pyright
    black

    # Rust
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer

    # Java
    temurin-bin
    google-java-format
    jdt-language-server

    # ------------------- #
    # Password Management #
    # ------------------- #
    _1password-gui
    _1password

    # ----- #
    # Fonts #
    # ----- #
    fira-code-nerdfont
    fira-sans
  ];
}
