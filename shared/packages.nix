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

      # Better ls
      eza

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

      reflex

      wget

      wuzz

      # ------------ #
      # Applications #
      # ------------ #

      # Communication
      discord

      # Gaming
      # prismlauncher

      # ----------- #
      # Programming #
      # ----------- #

      # cargo subcommands
      cargo-watch

      # SQL
      sqlx-cli

      # Markdown
      marksman

      # Python
      python3Full
      uv
      pyright

      # Rust
      rustup

      # Zig
      zls

      # Java
      google-java-format
      jdt-language-server

      # Nix
      alejandra

      # WGSL
      wgsl-analyzer

      # Toml
      taplo

      # ----- #
      # Fonts #
      # ----- #
      nerd-fonts.fira-code
      nerd-fonts.hack
      fira-sans
    ]
    ++ [
      inputs.helix.packages.${pkgs.system}.default
      inputs.ferrite.packages.${pkgs.system}.default
    ];
}
