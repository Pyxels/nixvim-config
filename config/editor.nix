{pkgs, ...}: {
  plugins = {
    oil = {
      enable = true;
      settings = {
        keymaps = {
          "l" = "actions.select";
          "h" = "actions.parent";
        };
        columns = [
          "permissions"
          "size"
          "icon"
        ];
      };
    };

    web-devicons.enable = true;

    undotree = {
      enable = true;
      settings.FocusOnToggle = true;
    };

    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        numhl = true;
        signs = {
          add.text = "▐";
          change.text = "▐";
          delete.text = "󰐊";
          topdelete.text = "󰐊";
          changedelete.text = "▐";
        };
      };
    };

    telescope = {
      enable = true;
    };

    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };
    treesitter-context = {
      enable = true;
      settings.max_lines = 2;
    };
    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
        };
      };
      move = {
        enable = true;
        gotoNextStart = {"]f" = "@function.outer";};
        gotoPreviousStart = {"[f" = "@function.outer";};
      };
    };

    nvim-surround.enable = true;

    comment.enable = true;

    luasnip.enable = true;

    nvim-bqf.enable = true;
  };

  extraPlugins = with pkgs; [
    vimPlugins.faster-nvim
  ];

  autoCmd = [
    {
      event = "FileType";
      pattern = "oil";
      command = "silent! lua vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>e', ':bd<CR>', { noremap = true, silent = true })";
    }
  ];

  keymaps = [
    {
      key = "<Leader>q";
      action = "<cmd>copen<cr>";
      options = {
        silent = true;
        desc = "Toggle qf list";
      };
    }
    # #################### Telescope ####################
    {
      key = "<Leader>b";
      action = "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>";
      options = {
        silent = true;
        desc = "Telescope [B]uffers";
      };
    }
    {
      key = "<Leader>f";
      action = "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false} )<cr>";
      options = {
        silent = true;
        desc = "[F]ind files";
      };
    }
    {
      key = "<Leader>F";
      action = "<cmd>Telescope live_grep theme=ivy<cr>";
      options = {
        silent = true;
        desc = "[F]ind Text";
      };
    }
    {
      key = "<Leader>sb";
      action = "<cmd>Telescope git_branches<cr>";
      options = {
        silent = true;
        desc = "[S]earch [B]ranches";
      };
    }
    {
      key = "<Leader>sh";
      action = "<cmd>Telescope help_tags<cr>";
      options = {
        silent = true;
        desc = "[S]earch [H]elp";
      };
    }
    {
      key = "<Leader>sR";
      action = "<cmd>Telescope registers<cr>";
      options = {
        silent = true;
        desc = "[S]earch [R]egisters";
      };
    }
    {
      key = "<Leader>sk";
      action = "<cmd>Telescope keymaps<cr>";
      options = {
        silent = true;
        desc = "[S]earch [K]eymaps";
      };
    }
    {
      key = "<Leader>sc";
      action = "<cmd>Telescope commands<cr>";
      options = {
        silent = true;
        desc = "[S]earch [C]ommands";
      };
    }

    # #################### Gitsigns ####################
    {
      key = "<Leader>gj";
      action = "<cmd>lua require 'gitsigns'.next_hunk()<cr>";
      options = {
        silent = true;
        desc = "[G]it: Next Hunk";
      };
    }
    {
      key = "<Leader>gk";
      action = "<cmd>lua require 'gitsigns'.prev_hunk()<cr>";
      options = {
        silent = true;
        desc = "[G]it: Prev Hunk";
      };
    }
    {
      key = "<Leader>gp";
      action = "<cmd>lua require 'gitsigns'.preview_hunk_inline()<cr>";
      options = {
        silent = true;
        desc = "[G]it: [P]review Hunk";
      };
    }
    {
      key = "<Leader>gr";
      action = "<cmd>lua require 'gitsigns'.reset_hunk()<cr>";
      options = {
        silent = true;
        desc = "[G]it: [R]eset Hunk";
      };
    }
    {
      key = "<Leader>gR";
      action = "<cmd>lua require 'gitsigns'.reset_buffer()<cr>";
      options = {
        silent = true;
        desc = "[G]it: [R]eset Buffer";
      };
    }
    {
      key = "<Leader>gs";
      action = "<cmd>lua require 'gitsigns'.stage_hunk()<cr>";
      options = {
        silent = true;
        desc = "[G]it: [S]tage Hunk";
      };
    }
    {
      key = "<Leader>gu";
      action = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>";
      options = {
        silent = true;
        desc = "[G]it: [U]ndo Stage Hunk";
      };
    }
    {
      key = "<Leader>gd";
      action = "<cmd>lua require 'gitsigns'.diffthis()<cr>";
      options = {
        silent = true;
        desc = "[G]it: [D]iff this buffer";
      };
    }
    {
      key = "<Leader>gl";
      action = "<cmd>lua require 'gitsigns'.toggle_linehl()<cr>";
      options = {
        silent = true;
        desc = "[G]it: Toggle [L]ine Highlight";
      };
    }

    # #################### Oil ####################
    {
      key = "<Leader>e";
      action = "<cmd>Oil<cr>";
      options = {
        silent = true;
        desc = "Toggle Oil fil[e]s";
      };
    }
    # #################### Undo Tree ####################
    {
      key = "<Leader>u";
      action = "<cmd>UndotreeToggle <cr>";
      options = {
        silent = true;
        desc = "Toggle [U]ndoTree";
      };
    }
  ];
}
