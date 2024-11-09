{ ... }: {
  programs.nixvim = {
    enable = true;

    coloshchemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}
