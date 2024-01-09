{
  colorschemes.gruvbox = {
    enable = true;
  };

  # Fix gruvbox-nvim background colors for noice and gitsigns
  # see https://github.com/ellisonleao/gruvbox.nvim/issues/230#issuecomment-1493883602
  highlight = {
    SignColumn = { fg="#ebdbb2"; bg="#282828"; };
    GruvboxGreenSign = { fg = "#b8bb26"; bg = ""; };
    GruvboxOrangeSign = { fg = "#fe8019"; bg = ""; };
    GruvboxPurpleSign = { fg = "#d3869b"; bg = ""; };
    GruvboxYellowSign = { fg = "#fabd2f"; bg = ""; };
    GruvboxRedSign = { fg = "#fb4934"; bg = ""; };
    GruvboxBlueSign = { fg = "#83a598"; bg = ""; };
    GruvboxAquaSign = { fg = "#8ec07c"; bg = ""; };
  };
}
