{...}: {
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      lualine.enable = true;

      telescope.enable = true;

      oil.enable = true;

      treesitter.enable = true;

      luasnip.enable = true;

      lsp = {
        enable = true;
        servers = {
          lua-ls.enable = true;
          rust-analyzer.enable = true;
        };
      };
    };
  };
}
