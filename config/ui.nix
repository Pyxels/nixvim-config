{pkgs, ...}: {
  plugins = {
    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "gruvbox";
          globalstatus = true;
        };
        sections = {
          lualine_c = [
            {
              __unkeyed = "filename";
              path = 1;
            }
          ];
          lualine_x = [
            {
              __unkeyed.__raw = ''function() if package.loaded["noice"] and require("noice").api.status.mode.has() then return require("noice").api.status.mode.get() end return "" end'';
            }
          ];
        };
      };
    };

    indent-blankline = {
      enable = true;
    };

    noice = {
      enable = true;
      lsp.override = {
        "cmp.entry.get_documentation" = true;
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
      };
      presets = {
        bottom_search = true;
        command_palette = true;
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    dressing-nvim
  ];

  keymaps = [
    {
      key = "<Leader>n";
      action = ":Noice dismiss<CR>";
      options = {
        silent = true;
        desc = "Clear [N]otifications";
      };
    }
  ];
}
