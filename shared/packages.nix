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

      fzf-make # Used for running makefile scripts in zellix

      yazi # Awesome Explorer!

      # ----------------- #
      # Misc Command Line #
      # ----------------- #

      # Editor
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

      # AI Assistant!
      aichat

      # ------------ #
      # Applications #
      # ------------ #

      # Terminal
      alacritty

      # Communication
      discord

      # Gaming
      prismlauncher

      # ----------- #
      # Programming #
      # ----------- #

<<<<<<< HEAD
      # Python
      python3Full
      uv
      ruff
      black

      # Rust
      rustfmt
      clippy

      # Zig
      zls

      # Java
      google-java-format
      jdt-language-server

=======
>>>>>>> 3fd61d4 (110 current  2024-11-12 17:20:12  24.11.20241018.4c2fcb0  6.6.57                          * - nixos)
      # Nix
      alejandra

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
