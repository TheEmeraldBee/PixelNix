{
  config,
  pkgs,
  ...
}: {
  extraPlugins = with pkgs.vimPlugins; [
    (nvim-treesitter.withPlugins (
      _:
        nvim-treesitter.allGrammars
        ++ [
          pkgs.tree-sitter.builtGrammars.tree-sitter-nu
        ]
    ))
  ];
}
