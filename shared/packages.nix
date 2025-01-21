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

      # Communication
      discord

      # Gaming
      prismlauncher

      # ----------- #
      # Programming #
      # ----------- #

      # Python
      python3Full
      uv
      ruff
      black
      python312Packages.jedi-language-server

      # Rust
      rustfmt
      clippy
      cargo
      rustc
      rust-analyzer

      # Zig
      zls

      # Java
      google-java-format
      jdt-language-server

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
