{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      direnv

      # ----- #
      # Shell #
      # ----- #
      nushell # Main Shell
      carapace # Autocompletions
      fzf # Fuzzy Finder

      # ----------------- #
      # Misc Command Line #
      # ----------------- #

      # Editor
      neovim
      nil

      # Rust Build Watching
      bacon

      # Task and CPU Usage Viewer
      htop

      # `cd` replacement
      zoxide

      # better `cat`
      bat

      # better `grep`
      ripgrep

      # Terminal Multiplexer
      zellij

      # Terminal Theming
      starship

      # Git
      gitui

      raylib

      # ------------ #
      # Applications #
      # ------------ #

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
      # zig
      # zls

      # Java
      temurin-bin
      google-java-format
      jdt-language-server

      # Nix
      alejandra

      # ------------------- #
      # Password Management #
      # ------------------- #
      # _1password
      # _1password-gui

      # ----- #
      # Fonts #
      # ----- #
      fira-code-nerdfont
      fira-sans
    ]
    ++ [
      inputs.helix.packages.${pkgs.system}.default
    ];
}
