{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.nixvim-config;
in {
  options.nixvim-config = {
    enable = lib.mkEnableOption "Add nvim with this nixvim config to packages.";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.nixvim-config;
      description = "Nixvim with config";
    };

    aliases = with lib.types;
      lib.mkOption {
        type = listOf str;
        default = [];
        example = ["v" "vim"];
        description = "List of aliases to be added to bash";
      };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [cfg.package];
      sessionVariables.EDITOR = "nvim";

      shellAliases = lib.mkIf (builtins.length cfg.aliases > 0) (
        builtins.listToAttrs (
          builtins.map (alias: {
            name = alias;
            value = "nvim";
          })
          cfg.aliases
        )
      );
    };
  };
}
