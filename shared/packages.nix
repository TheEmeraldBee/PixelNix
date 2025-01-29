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

      jujutsu # Git replacement
      lazyjj # Jujutsu UI

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
      rustup

      # AI LSP
      lsp-ai

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
      inputs.ferrite.packages.${pkgs.system}.default
    ];
}
