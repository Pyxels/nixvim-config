{
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
      };
    };

    indent-blankline = {
      enable = true;
    };

    notify.enable = true;
    noice.enable = true;

    fidget.enable = true;
  };

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
  ];
}
