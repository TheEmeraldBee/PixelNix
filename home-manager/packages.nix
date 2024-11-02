{pkgs, ...}: {
  home.packages = with pkgs; [
    # ----- #
    # Shell #
    # ----- #
    zsh
    oh-my-zsh

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
    eza
    bat

    # Multiplexing
    zellij

    # Misc
    wget
    gnutar
    fzf
    alejandra

    # Git
    gitui
    gitkraken

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

    # Gaming
    everest-mons

    # Work
    xournalpp

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
