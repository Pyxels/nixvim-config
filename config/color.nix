{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [gruvbox-baby];

  colorscheme = "gruvbox-baby";

  # make s/x/y/gc highlighting work, see https://github.com/luisiacc/gruvbox-baby/issues/70#issuecomment-2205861831
  globals.gruvbox_baby_highlights = {
    IncSearch = {
      bg = "#ff9e64";
      fg = "White";
    };
    CurSearch = {link = "IncSearch";};
  };
}
