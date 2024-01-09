{
  plugins = {
    nvim-tree = {
      enable = true;
      disableNetrw = true;
      autoClose = true;
      actions.openFile.quitOnOpen = true;
      view.width = {
        min = 30;
        max = -1;
        padding = 1;
      };
      hijackCursor = true;
      syncRootWithCwd = true;
      respectBufCwd = true;
      updateFocusedFile = {
        enable = true;
        updateRoot = true;
      };
    };

    undotree = {
      enable = true;
      focusOnToggle = true;
    };

    gitsigns = {
      enable = true;
      currentLineBlame = true;
      numhl = true;
      signs = {
        add.text = "▐";
        change.text = "▐";
        delete.text = "󰐊";
        topdelete.text = "󰐊";
        changedelete.text = "▐";
      };
    };

    telescope = {
      enable = true;
    };

    treesitter = {
      enable = true;
    };

    surround.enable = true;

    comment-nvim.enable = true;

    luasnip.enable = true;
  };

  keymaps = [
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
      key = "<Leader>P";
      action = "<cmd>lua require('telescope').extensions.projects.projects()<cr>";
      options = {
        silent = true;
        desc = "[P]rojects";
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
      key = "<Leader>sC";
      action = "<cmd>Telescope colorscheme<cr>";
      options = {
        silent = true;
        desc = "[S]earch [C]olorschemes";
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
      key = "<Leader>sM";
      action = "<cmd>Telescope man_pages<cr>";
      options = {
        silent = true;
        desc = "[S]earch [M]an Pages";
      };
    }
    {
      key = "<Leader>sr";
      action = "<cmd>Telescope oldfiles<cr>";
      options = {
        silent = true;
        desc = "[S]earch [R]ecent Files";
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

    # #################### Nvim Tree ####################
    {
      key = "<Leader>e";
      action = "<cmd>NvimTreeToggle<cr>";
      options = {
        silent = true;
        desc = "Toggle NvimTr[e]e";
      };
    }
    {
      key = "<Leader>E";
      action = "<cmd>NvimTreeFindFile<cr>";
      options = {
        silent = true;
        desc = "Show current file in Tre[E]";
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
