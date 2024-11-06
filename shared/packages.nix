{ pkgs, ... }: {
  home.packages = with pkgs; [
    # ----- #
    # Shell #
    # ----- #
    nushell # Main Shell
    carapace # Autocompletions

    # ----------------- #
    # Misc Command Line #
    # ----------------- #

    # Editor
    helix

    # Rust Build Watching
    bacon

    # Task and CPU Usage Viewer
    htop

    # `cd` replacement
    zoxide

    # better `cat`
    bat

    # Terminal Multiplexer
    zellij

    # ------------ #
    # Applications #
    # ------------ #

    # Terminal
    alacritty

    # Communication
    discord
    teams

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

    
    # # ------------------- #
    # # Password Management #
    # # ------------------- #
    # _1password
    # _1password-gui

    # ----- #
    # Fonts #
    # ----- #
    fira-code-nerdfont
    fira-sans
  ];

}
