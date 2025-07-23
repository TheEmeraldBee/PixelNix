[
  {
    mode = "n";
    key = "<C-j>";
    action = "<cmd>m +1<cr>";
    options.desc = "Swap current line down";
  }
  {
    mode = "n";
    key = "<C-k>";
    action = "<cmd>m -2<cr>";
    options.desc = "Swap current line up";
  }
  {
    mode = [
      "n"
      "x"
      "v"
    ];
    key = "gl";
    action = "$";
    options.desc = "Go to end of line";
  }
  {
    mode = [
      "n"
      "x"
      "v"
    ];
    key = "gh";
    action = "^";
    options.desc = "Go to start of line (first non-blank)";
  }
]
