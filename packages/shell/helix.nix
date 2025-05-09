{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs;
    [
      ####################
      # Language Servers #
      ####################
      # Nix
      nil
      alejandra

      marksman # Markdown
      zls # Zig

      # Java
      google-java-format
      jdt-language-server

      wgsl-analyzer # WGSL

      # Misc Language Servers
      vscode-langservers-extracted

      taplo # Toml
    ]
    ++ [
      ##########
      # Editor #
      ##########
      inputs.helix.packages.${pkgs.system}.default
    ];
  xdg.configFile."helix" = {
    source = ./helix;
    recursive = true;
  };
}
