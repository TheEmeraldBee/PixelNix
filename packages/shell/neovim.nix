let
  selectOpts = ''
    {
      behavior = cmp.SelectBehavior.Insert
    }
  '';
in
{ ... }:
{
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";

    opts = {
      updatetime = 100;
      number = true;
      relativenumber = true;

      termguicolors = true;

      autoindent = true;
      cursorline = true;
      list = true;

      completeopt = [
        "menuone"
        "noselect"
        "noinsert"
      ];
      expandtab = true;
      shiftwidth = 2;
      smarttab = true;

      signcolumn = "yes";
      mouse = "a";
      clipboard = {
        providers.wl-copy.enable = true; # Use wl-copy for wayland and xsel for Xorg
        register = "unnamedplus";
      };
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        transparent_background = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
      }
      {
        mode = "n";
        key = "<leader>ft";
        action = "<cmd>Yazi<cr>";
      }
      {
        mode = "n";
        key = ";q";
        action = "<cmd>bdelete<cr>";
      }
      {
        mode = "n";
        key = ";Q";
        action = ":quit<cr>";
      }
      {
        mode = "n";
        key = ";w";
        action = ":write<cr>";
      }
      {
        mode = "n";
        key = ";m";
        action = ''<cmd>TermExec cmd="try { ferrite }; input -n 1 -s; exit" direction=float<cr>'';
      }
      {
        mode = "n";
        key = ";s";
        action = "<cmd>TermNew direction=float<cr>";
      }
      {
        mode = "n";
        key = "gn";
        action = "<cmd>BufferLineCycleNext<cr>";
      }
      {
        mode = "n";
        key = "gp";
        action = "<cmd>BufferLineCyclePrev<cr>";
      }
      {
        mode = "n";
        key = "U";
        action = "<C-r>";
      }
    ];

    plugins = {
      web-devicons.enable = true;

      lualine.enable = true;
      bufferline.enable = true;
      luasnip.enable = true;

      telescope.enable = true;

      oil.enable = true;

      treesitter.enable = true;

      yazi.enable = true;

      which-key.enable = true;

      nvim-autopairs.enable = true;

      noice.enable = true;

      overseer.enable = true;

      toggleterm.enable = true;

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          performance = {
            debounce = 150;
          };
          sources = [
            { name = "path"; }
            {
              name = "nvim_lsp";
              keywordLength = 1;
            }
            {
              name = "buffer";
              keywordLength = 3;
            }
            { name = "luasnip"; }
          ];

          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          formatting = {
            fields = [
              "abbr"
              "kind"
              "menu"
            ];
            # format = lspkindFormat;
          };

          mapping = {
            "<Up>" = "cmp.mapping.select_prev_item(${selectOpts})";
            "<Down>" = "cmp.mapping.select_next_item(${selectOpts})";

            "<C-p>" = "cmp.mapping.select_prev_item(${selectOpts})";
            "<C-n>" = "cmp.mapping.select_next_item(${selectOpts})";

            "<C-u>" = "cmp.mapping.scroll_docs(-4)";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";

            "<C-e>" = "cmp.mapping.abort()";
            "<C-y>" = "cmp.mapping.confirm({select = true})";
            "<CR>" = "cmp.mapping.confirm({select = false})";

            "<C-f>" = ''
              cmp.mapping(
                function(fallback)
                  if luasnip.jumpable(1) then
                    luasnip.jump(1)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<C-b>" = ''
              cmp.mapping(
                function(fallback)
                  if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<Tab>" = ''
              cmp.mapping(
                function(fallback)
                  local col = vim.fn.col('.') - 1

                  if cmp.visible() then
                    cmp.select_next_item(select_opts)
                  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                  else
                    cmp.complete()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<S-Tab>" = ''
              cmp.mapping(
                function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';
          };
          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
              zindex = 1001;
              scrolloff = 0;
              colOffset = 0;
              sidePadding = 1;
              scrollbar = true;
            };
            documentation = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
              zindex = 1001;
              maxHeight = 20;
            };
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      lspkind.enable = true;
      lspkind.cmp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-treesitter.enable = true;

      jdtls = {
        enable = true;
        settings = {
          cmd = [ "jdtls" ];
          root_dir = {
            __raw = "  vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])\n";
          };
          init_options.settings.java.imports.gradle = {
            enabled = true;
            wrapper = {
              enabled = true;
              checksums = [
                {
                  sha256 = "81a82aaea5abcc8ff68b3dfcb58b3c3c429378efd98e7433460610fecd7ae45f";
                  allowed = true;
                }
              ];
            };
          };
        };
      };

      lsp-format.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          rust_analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
          nil_ls.enable = true; # Nix
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            "<leader>k" = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>cw" = {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
          diagnostic = {
            "<leader>cd" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "[d" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "]d" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
      };
    };
  };
}
