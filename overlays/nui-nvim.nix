# copied from https://github.com/gshpychka/dotfiles
# keep this until nui-nvim is updated to 0.4.0 in nixpkgs
# https://github.com/NixOS/nixpkgs/blob/cfab6b59f7258025e37fe30a31efbd94a6638129/pkgs/development/lua-modules/generated-packages.nix#L4039
(
  final: prev: let
    newNui = final.vimUtils.buildVimPlugin {
      pname = "nui-nvim";
      version = "0.4.0-1";
      src = final.fetchFromGitHub {
        owner = "MunifTanjim";
        repo = "nui.nvim";
        rev = "0.4.0";
        hash = "sha256-SJc9nfV6cnBKYwRWsv0iHy+RbET8frNV85reICf+pt8=";
      };
    };
  in {
    vimPlugins =
      prev.vimPlugins
      // {
        # 1. replace the old package
        nui-nvim = newNui;

        # 2. make sure noice pulls in the same copy
        # this is necessary because of how buildLuarocksPackage works
        noice-nvim = prev.vimPlugins.noice-nvim.overrideAttrs (_: {
          dependencies = [newNui];
        });
      };
  }
)
