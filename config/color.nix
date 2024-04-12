{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [gruvbox-baby];
  colorscheme = "gruvbox-baby";
}
