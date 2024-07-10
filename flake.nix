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
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
        };
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          nixvim = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "A nixvim configuration";
          };

          git-hooks = git-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              alejandra.enable = true;
              flake-checker.enable = true;
              nil.enable = true;
              deadnix.enable = true;
              statix.enable = true;

              shellcheck.enable = true;
              actionlint.enable = true;
              commitizen.enable = true;
              check-merge-conflicts.enable = true;

              yamllint = {
                enable = true;
                settings.configuration = ''
                  rules:
                    truthy:
                      check-keys: false
                '';
              };
              check-yaml.enable = true;
            };
          };
        };

        devShells.default = pkgs.mkShell {
          inherit (self'.checks.git-hooks) shellHook;
          buildInputs = self'.checks.git-hooks.enabledPackages;
        };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };
      };
    };
}
