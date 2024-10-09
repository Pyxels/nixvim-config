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
      onAttach = {
        __raw = ''
          -- open directories and files with l
          function(bufnr)
            local api = require("nvim-tree.api")
            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set("n", "l", api.node.open.edit, { buffer = bufnr, noremap = true, desc = "Edit Or Open" })
          end
        '';
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
    };

    nvim-surround.enable = true;

    comment.enable = true;

    luasnip.enable = true;

    nvim-bqf.enable = true;
  };

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
