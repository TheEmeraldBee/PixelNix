{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ####################
    # Language Servers #
    ####################
    # Nix
    nil
    alejandra

    marksman # Markdown

    wgsl-analyzer # WGSL

    # Misc Language Servers
    vscode-langservers-extracted

    taplo # TOML
  ];

  xdg.configFile."nvim/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";

    # Import modules
    imports = [
      ./options.nix
      ./keymaps/init.nix
      ./plugins/init.nix
      ./plugins/cmp.nix
      ./plugins/lsp.nix
      ./plugins/treesitter.nix
      ./plugins/ui.nix
    ];
  };
}
