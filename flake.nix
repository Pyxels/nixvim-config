{
  description = "Pyxels Nixvim";

  inputs = {
    nixpkgs.follows = "nixvim/nixpkgs";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "git-hooks";
        home-manager.follows = "";
        nix-darwin.follows = "";
      };
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixvim,
    flake-parts,
    git-hooks,
    ...
  } @ inputs: let
    config = import ./config; # import the module directly
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        pkgs,
        system,
        self',
        ...
      }: let
        nixvim-config = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = config;
        };
      in {
        checks = {
          # Run `nix flake check .` to verify that the config is not broken
          nixvim = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
            nvim = nixvim-config;
            name = "A nixvim configuration";
          };

          git-hooks = import ./git-hooks.nix {inherit git-hooks system;};
        };

        devShells.default = pkgs.mkShell {
          inherit (self'.checks.git-hooks) shellHook;
          buildInputs = self'.checks.git-hooks.enabledPackages;
        };

        packages = {
          inherit nixvim-config;
          # Lets you run `nix run .` to start nixvim
          default = nixvim-config;
        };
      };

      flake = {
        homeModules.default = {
          config,
          lib,
          pkgs,
          ...
        }: let
          cfg = config.nixvim-config;
        in {
          options.nixvim-config = {
            enable = lib.mkEnableOption "Add nvim with this nixvim config to packages.";

            aliases = with lib.types;
              lib.mkOption {
                description = "List of aliases to be added to bash";
                type = listOf str;
                default = [];
                example = ["v" "vim"];
              };
          };

          config = lib.mkIf cfg.enable {
            home = {
              packages = [inputs.self.packages.${pkgs.system}.nixvim-config];
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
        };
      };
    };
}
