{
  git-hooks,
  system,
  pkgs,
  ...
}:
git-hooks.lib.${system}.run {
  src = ./.;
  package = pkgs.prek;
  hooks = {
    alejandra.enable = true;
    flake-checker.enable = true;
    nil.enable = true;
    deadnix.enable = true;
    statix.enable = true;

    shellcheck = {
      enable = true;
      excludes = ["\.envrc"];
    };
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
}
