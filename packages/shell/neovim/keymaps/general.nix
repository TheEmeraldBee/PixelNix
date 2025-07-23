[
  {
    mode = "n";
    key = "<leader>l";
    action.__raw = "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
    options.desc = "Toggle Inlay Hints";
  }
  {
    mode = "n";
    key = "<leader>a";
    action.__raw = "function() vim.lsp.buf.code_action() end";
    options.desc = "Code Actions";
  }
  {
    mode = "n";
    key = ";q";
    action = "<cmd>bdelete<cr>";
    options.desc = "Delete buffer";
  }
  {
    mode = "n";
    key = ";Q";
    action = ":quit<cr>";
    options.desc = "Quit Neovim";
  }
  {
    mode = "n";
    key = ";w";
    action = ":write<cr>";
    options.desc = "Write buffer";
  }
  {
    mode = "n";
    key = "U";
    action = "<C-r>";
    options.desc = "Redo";
  }
  {
    mode = "n";
    key = ";r";
    action = "<cmd>e!<cr>";
    options.desc = "Reload file from disk";
  }
  {
    mode = "n";
    key = ";f";
    action = "<cmd>Format<cr>";
    options.desc = "Format file";
  }
  {
    mode = "n";
    key = "<leader>Y";
    action = ''"+yy'';
    options.desc = "Yank current line to system clipboard";
  }
  {
    mode = [
      "v"
      "x"
    ];
    key = "<leader>Y";
    action = ''"+y'';
    options.desc = "Yank selection to system clipboard";
  }
]
