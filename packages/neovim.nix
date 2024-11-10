{...}: {
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    opts = {
      number = true;
      tabstop = 2;
      softtabstop = 2;

      showtabline = 2;

      expandtab = true;
      smartindent = true;
      shiftwidth = 2;
    };

    plugins = {
      web-devicons.enable = true;

      lualine.enable = true;

      telescope.enable = true;

      oil.enable = true;

      treesitter.enable = true;

      luasnip.enable = true;

      vim-surround.enable = true;

      nvim-tree.enable = true;

      bufferline.enable = true;

      which-key.enable = true;

      leap.enable = true;

      zig.enable = true;

      avante = {
        enable = true;
        settings = {
          provider = "gemini";
          gemini = {
            api_key_name = "cmd:cat /run/secrets/ai-key";
          };
        };
      };

      lsp = {
        enable = true;
        servers = {
          # Lua
          lua_ls.enable = true;

          zls.enable = true;

          # Rust
          rust_analyzer.enable = true;
          rust_analyzer.installRustc = false;
          rust_analyzer.installCargo = false;
        };
      };
    };

    globals.mapleader = " ";

    keymaps = [
      # -------------- #
      # File Exploring #
      # -------------- #
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = {desc = "Find Files";};
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options = {desc = "Grep Files";};
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        options = {desc = "View Buffers";};
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
        options = {desc = "View Help Tags";};
      }
      {
        mode = "n";
        key = "<leader>ft";
        action = "<cmd>NvimTreeToggle<cr>";
        options = {desc = "Toggle File Tree";};
      }
      {
        mode = "n";
        key = "<leader>fo";
        action = "<cmd>Oil<cr>";
        options = {desc = "Open Oil";};
      }
    ];
  };
}
