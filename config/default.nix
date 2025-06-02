{pkgs, ...}: {
  imports = [
    ./ui.nix
    ./color.nix
    ./editor.nix
    ./keymaps.nix
    ./options.nix
    ./autocommands.nix
    ./lsp.nix
    ./cmp.nix
  ];
  extraPackages = with pkgs; [ripgrep];
}
