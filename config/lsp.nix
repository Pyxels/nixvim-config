{
  pkgs,
  lib,
  ...
}: {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nil-ls.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;
        };
        # vue workaround: see https://github.com/nix-community/nixvim/issues/1937
        # additional configuration for volar
        # https://github.com/vuejs/language-tools?tab=readme-ov-file#hybrid-mode-configuration-requires-vuelanguage-server-version-200
        ts-ls = {
          enable = true;
          filetypes = [
            "typescript"
            "javascript"
            "javascriptreact"
            "typescriptreact"
            "vue"
          ];
          extraOptions = {
            init_options = {
              plugins = [
                {
                  name = "@vue/typescript-plugin";
                  location = "${lib.getBin pkgs.vue-language-server}/lib/node_modules/@vue/language-server";
                  languages = ["vue"];
                }
              ];
            };
          };
        };
        volar = {
          enable = true;
          package = pkgs.vue-language-server;
        };
        bashls.enable = true;
        gopls.enable = true;
      };

      postConfig = "
        vim.diagnostic.config({
          severity_sort = true,
          float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            prefix = '',
            header = '',
          }
        })";
    };

    none-ls = {
      enable = true;

      sources = {
        formatting.prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        formatting.alejandra.enable = true;
      };
    };

    crates-nvim.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = package-info-nvim;
      config = "lua require('package-info').setup({ hide_up_to_date = true })";
    }
  ];

  keymaps = [
    {
      key = "<Leader>li";
      action = "<cmd>LspInfo<cr>";
      options = {
        silent = true;
        desc = "LSP: Current [I]nfo";
      };
    }
    {
      key = "<Leader>la";
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      options = {
        silent = true;
        desc = "LSP: Code Action";
      };
    }
    {
      key = "<Leader>ld";
      action = "<cmd>Telescope diagnostics<cr>";
      options = {
        silent = true;
        desc = "LSP: Document Diagnostics";
      };
    }
    {
      key = "<Leader>lf";
      action = "<cmd>lua vim.lsp.buf.format({async = true})<cr>";
      options = {
        silent = true;
        desc = "LSP: Format";
      };
    }
    {
      key = "<Leader>lj";
      action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      options = {
        silent = true;
        desc = "LSP: Next Diagnostic";
      };
    }
    {
      key = "<Leader>lk";
      action = "<cmd>lua vim.diagnostic.goto_prev()<cr>";
      options = {
        silent = true;
        desc = "LSP: Prev Diagnostic";
      };
    }
    {
      key = "<Leader>ll";
      action = "<cmd>lua vim.lsp.codelens.run()<cr>";
      options = {
        silent = true;
        desc = "LSP: CodeLens Action";
      };
    }
    {
      key = "<Leader>lq";
      action = "<cmd>lua vim.diagnostic.setloclist()<cr>";
      options = {
        silent = true;
        desc = "Add diagnostics to quickfix list";
      };
    }
    {
      key = "<Leader>lr";
      action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      options = {
        silent = true;
        desc = "LSP: Rename";
      };
    }
    {
      key = "<Leader>ls";
      action = "<cmd>Telescope lsp_document_symbols<cr>";
      options = {
        silent = true;
        desc = "LSP: Document Symbols";
      };
    }

    {
      key = "gd";
      action = "<cmd>Telescope lsp_definitions<CR>";
      options = {
        silent = true;
        desc = "LSP: Show definition";
      };
    }
    {
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      options = {
        silent = true;
        desc = "LSP: Hover";
      };
    }
    {
      key = "gi";
      action = "<cmd>Telescope lsp_implementations<CR>";
      options = {
        silent = true;
        desc = "LSP: Show implemetation";
      };
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
      options = {
        silent = true;
        desc = "LSP: Signature help";
      };
    }
    {
      key = "gr";
      action = "<cmd>Telescope lsp_references<CR>";
      options = {
        silent = true;
        desc = "LSP: Show references";
      };
    }
  ];
}
