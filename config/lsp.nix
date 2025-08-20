{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nil_ls.enable = true;
        rust_analyzer = {
          enable = true;
          packageFallback = true;
          installRustc = true;
          installCargo = true;
          installRustfmt = true;
          settings.check.allTargets = false;
        };

        ts_ls.enable = true;
        volar.enable = true;
        angularls.enable = true;
        bashls.enable = true;
        gopls.enable = true;
        jdtls = {
          enable = true;
          cmd = [
            (lib.getExe pkgs.jdt-language-server)
            "--jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar"
          ];
        };
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
        formatting = {
          prettierd = {
            enable = true;
            disableTsServerFormatter = true;
          };
          alejandra.enable = true;
          google_java_format.enable = true;
        };
      };
    };

    crates.enable = true;
    package-info = {
      enable = true;
      settings.hide_up_to_date = true;
    };
  };

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
