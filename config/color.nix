{pkgs, ...}: let
  gruvbox-baby = pkgs.vimUtils.buildVimPlugin {
    name = "gruvbox-baby";
    src = pkgs.fetchFromGitHub {
      owner = "luisiacc";
      repo = "gruvbox-baby";
      rev = "bd52e62d8134647090108189e69c8b3cd18bdbbf";
      hash = "sha256-UhOYkVInyQrPy970NMKfFhq3JZA2zuWQdyDOfv9glp8=";
    };
  };
in {
  extraPlugins = [gruvbox-baby];
  colorscheme = "gruvbox-baby";
}
