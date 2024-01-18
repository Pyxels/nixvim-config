{pkgs, ...}: {
  plugins = {
    bufferline = {
      enable = true;
      diagnostics = "nvim_lsp";
      showCloseIcon = false;
      showBufferCloseIcons = false;
    };

    lualine = {
      enable = true;
      theme = "gruvbox";
      globalstatus = true;
      sections = {
        lualine_c = [
          {
            name = "filename";
            extraConfig.path = 1;
          }
        ];
        lualine_x = [
          {
            name = {
              __raw = ''function() if package.loaded["noice"] and require("noice").api.status.mode.has() then return require("noice").api.status.mode.get() end return "" end'';
            };
          }
        ];
      };
    };

    indent-blankline = {
      enable = true;
    };

    noice.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    dressing-nvim
  ];

  keymaps = [
    {
      key = "<S-l>";
      action = ":BufferLineCycleNext<CR>";
      options = {
        silent = true;
        desc = "Next buffer";
      };
    }
    {
      key = "<S-h>";
      action = ":BufferLineCyclePrev<CR>";
      options = {
        silent = true;
        desc = "Previous buffer";
      };
    }
    {
      key = "<Leader>B";
      action = ":BufferLineTogglePin<CR>";
      options = {
        silent = true;
        desc = "Pin [B]uffer";
      };
    }

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
