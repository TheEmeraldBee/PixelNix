{pkgs, ...}: {
  home.packages = with pkgs; [
    # ----- #
    # Shell #
    # ----- #
    nushell

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
    bat
    carapace

    # Multiplexing
    zellij

    # Misc
    alejandra

    # Git
    gitui

    # Screenshots
    grim
    slurp

    feh

    # ------------ #
    # Applications #
    # ------------ #

    # Audio Editor
    pavucontrol

    # Terminal
    alacritty

    # Communication
    discord

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

    # Zig
    zig
    zls

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
