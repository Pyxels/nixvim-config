{
  description = "Pyxels Nixvim";

  inputs = {
    nixpkgs.follows = "nixvim/nixpkgs";
    nixpkgs-jdtls.url = "github:nixos/nixpkgs/bce5fe2bb998488d8e7e7856315f90496723793c";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.flake-parts.follows = "flake-parts";
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
    flake-parts.lib.mkFlake {inherit inputs;} (
      {moduleWithSystem, ...}: {
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
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfreePredicate = pkg:
              builtins.elem (inputs.nixpkgs.lib.getName pkg) [
                "faster.nvim"
              ];
            overlays = [
              (_final: _prev: {
                jdtls-1_49 = inputs.nixpkgs-jdtls.legacyPackages.${system}.jdt-language-server;
              })
            ];
          };
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
          homeModules.default = moduleWithSystem (
            {config}: _: {
              imports = [./home-manager-module.nix];
              nixvim-config.package = config.packages.default;
            }
          );

          nixosModules.default = moduleWithSystem (
            {config}: _: {
              imports = [./nixos-module.nix];
              nixvim-config.package = config.packages.default;
            }
          );
        };
      }
    );
}
