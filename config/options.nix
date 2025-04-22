{
  config = {
    opts = {
      ignorecase = true; # ignore case in search patterns
      smartcase = true; # smart case
      pumheight = 10; # pop up menu max height
      smartindent = true; # make indenting smarter again
      splitbelow = true; # force all horizontal splits to go below current window
      splitright = true; # force all vertical splits to go to the right of current window
      swapfile = false; # creates a swapfile
      timeoutlen = 400; # time to wait for a mapped sequence to complete (in milliseconds)
      undofile = true; # enable persistent undo
      updatetime = 300; # faster completion (4000ms default)
      writebackup = false; # if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
      expandtab = true; # convert tabs to spaces
      shiftwidth = 2; # the number of spaces inserted for each indentation
      tabstop = 2; # insert 2 spaces for a tab
      cursorline = true; # highlight the current line
      number = true; # set numbered lines
      relativenumber = true; # set relative numbered lines
      signcolumn = "yes"; # always show the sign column, otherwise it would shift the text each time
      wrap = true; # wrap long lines
      scrolloff = 8; # is one of my fav, always keep 8 lines
      sidescrolloff = 8;
      guifont = "monospace:h17"; # the font used in graphical neovim applications
      listchars = "tab:▷▷⋮,nbsp:␣,trail:·"; # characters to show instead of whitespace
      list = true; # show characters defined in listchars
      mousemodel = "extend"; # no right click
      showmode = false;
      fillchars = {fold = " ";}; # remove trailing chars from fold header
      foldmethod = "expr"; # use treesitter expr
      foldexpr = "v:lua.vim.treesitter.foldexpr()"; # use treesitter expr
      foldlevel = 99; # open all folds on start
    };
  };
}
