{
  globals.mapleader = " ";

  keymaps = [
    # #################### Movement ####################
    {
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        silent = true;
        desc = "Select the window to the left";
      };
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        silent = true;
        desc = "Select the window to the bottom";
      };
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        silent = true;
        desc = "Select the window to the top";
      };
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        silent = true;
        desc = "Select the window to the right";
      };
    }

    {
      key = "<C-Up>";
      action = ":resize +2<CR>";
      options = {
        silent = true;
        desc = "Resize +2";
      };
    }
    {
      key = "<C-Down>";
      action = ":resize -2<CR>";
      options = {
        silent = true;
        desc = "Resize -2";
      };
    }
    {
      key = "<C-Left>";
      action = ":vertical resize +2<CR>";
      options = {
        silent = true;
        desc = "Resize +2";
      };
    }
    {
      key = "<C-Right>";
      action = ":vertical resize -2<CR>";
      options = {
        silent = true;
        desc = "Resize -2";
      };
    }

    {
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        silent = true;
        desc = "Half page navigation and centering";
      };
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        silent = true;
        desc = "Half page navigation and centering";
      };
    }

    {
      key = "n";
      action = "nzz";
      options = {
        silent = true;
        desc = "Center when moving through search";
      };
    }
    {
      key = "<S-n>";
      action = "<S-n>zz";
      options = {
        silent = true;
        desc = "Center when moving through search";
      };
    }

    {
      key = "<A-j>";
      action = "<Esc>:m .+1<CR>==";
      options = {
        silent = true;
        desc = "Move line down";
      };
    }
    {
      key = "<A-k>";
      action = "<Esc>:m .-2<CR>==";
      options = {
        silent = true;
        desc = "Move line up";
      };
    }

    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        silent = true;
        desc = "Unindent block and stay in Visual";
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        silent = true;
        desc = "Indent block and stay in Visual";
      };
    }

    {
      mode = "v";
      key = "<A-j>";
      action = ":m .+1<CR>==";
      options = {
        silent = true;
        desc = "Move text block up";
      };
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m .-2<CR>==";
      options = {
        silent = true;
        desc = "Move text block down";
      };
    }

    {
      mode = "v";
      key = "p";
      action = "\"_dP";
      options = {
        silent = true;
        desc = "When pasting on selection keep pasted in register";
      };
    }

    {
      mode = "x";
      key = "<A-j>";
      action = ":move \">+1<CR>gv-gv";
      options = {
        silent = true;
        desc = "Move visual block down";
      };
    }
    {
      mode = "x";
      key = "<A-k>";
      action = ":move \"<-2<CR>gv-gv";
      options = {
        silent = true;
        desc = "Move visual block up";
      };
    }

    {
      mode = ["n" "v"];
      key = "<Leader>y";
      action = "\"+y";
    }
    {
      mode = "n";
      key = "<Leader>Y";
      action = "\"+Y";
    }
    {
      mode = ["n" "v"];
      key = "<Leader>p";
      action = "\"+p";
    }

    {
      key = "<Leader>r";
      action = "<cmd>w!<CR>";
      options = {
        silent = true;
        desc = "Save";
      };
    }
    {
      key = "<Leader>c";
      action = "<cmd>bp|bd #<CR>";
      options = {
        silent = true;
        desc = "Close current Buffer";
      };
    }
    {
      key = "<Leader>C";
      action = "<cmd>%bd|e#|bd#<CR>";
      options = {
        silent = true;
        desc = "Close all but current Buffer";
      };
    }
    {
      key = "<Leader>h";
      action = "<cmd>nohlsearch<CR>";
      options = {
        silent = true;
        desc = "Remove highlights";
      };
    }
  ];
}
