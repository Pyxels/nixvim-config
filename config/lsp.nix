{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nil_ls = {
          enable = true;
          onAttach.function = ''
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          '';
        };
        rust_analyzer = {
          enable = true;
          packageFallback = true;
          installRustc = true;
          installCargo = true;
          installRustfmt = true;
          settings.check.allTargets = false;
        };

        ts_ls.enable = true;
        vue_ls.enable = true;
        angularls = {
          enable = true;
          onAttach.function = ''
            for _, other_client in ipairs(vim.lsp.get_clients()) do
              if other_client.name == "ts_ls" then
                other_client.server_capabilities.referencesProvider = false
              end
            end
          '';
        };
        bashls.enable = true;
        gopls.enable = true;
        jdtls = {
          enable = true;
          package = pkgs.jdtls-1_49; # i was having issues with 1.51 crashing regularely
          rootMarkers = [".git"];
          settings.java.format.enabled = false; # in favor of google-java-format via null-ls
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
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
            settings.extra_filetypes = ["json5"];
          };
          alejandra.enable = true;
          google_java_format.enable = true;
          xmllint.enable = true;
        };
      };
    };

    crates.enable = true;
    package-info = {
      enable = true;
      settings.hide_up_to_date = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    sonarlint-nvim
  ];
  plugins.lsp.luaConfig.post = with pkgs;
  # lua
    ''
      require("sonarlint").setup({
        server = {
          cmd = {
            "${lib.getExe sonarlint-ls}",
            "-stdio",
            "-analyzers",
            vim.fn.expand("${sonarlint-ls}/share/plugins/sonarjava.jar")
          },
          settings = {
            sonarlint = {
              rules = {
                ["java:S1192"] = { level = "off" },
              },
            },
          },
        },
        filetypes = { "java" },
      })
    '';

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
      action = "<cmd>lua vim.diagnostic.jump({ count = 1 })<CR>";
      options = {
        silent = true;
        desc = "LSP: Next Diagnostic";
      };
    }
    {
      key = "<Leader>lk";
      action = "<cmd>lua vim.diagnostic.jump({ count = -1 })<cr>";
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
