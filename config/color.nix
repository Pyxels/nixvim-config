{pkgs, ...}: let
  gruvbox-baby = pkgs.vimUtils.buildVimPlugin {
    name = "gruvbox-baby";
    src = pkgs.fetchFromGitHub {
      owner = "luisiacc";
      repo = "gruvbox-baby";
      rev = "436f73d6a45777eadedbd2f842f766d093266eb3";
      hash = "sha256-UPxfOkkLcK54g43fOrFukiXVdzgx8wQ2ve4QgTyzC7k=";
    };
  };
in {
  extraPlugins = [gruvbox-baby];
  colorscheme = "gruvbox-baby";
}
