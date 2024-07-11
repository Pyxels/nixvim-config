# Pyxels Neovim

Neovim config using [Nixvim](https://github.com/nix-community/nixvim).
Compared to my [previous lua config](https://github.com/Pyxels/nvim-config) this is a lot more simple with some seldom used features and overcomplicated configs missing (and it has grown to be a bit different over time).

> [!NOTE]
> This is my personal config tailored to my specific needs, but can be used as reference or as inspiration for your own config.

## Try it out
To try out this config just run:

```nix
nix run github:pyxels/nixvim-config
```

## Usage
Add this repo to you your inputs:

```nix
inputs = {
  nixvim-config.url = "github:pyxels/nixvim-config";
};
```

### Standalone
You can access the nvim + config package itself and add them to your packages.

```nix
# home-manager
home.packages = [
    inputs.nixvim-config.packages.${system}.default
];
```
```nix
# nixos
environment.systemPackages = [
    inputs.nixvim-config.packages.${system}.default
];
```

### Home-Manager module
This flake also exposes a simple home manger module to enable the config and set shell aliases.

```nix
imports = [
  inputs.nixvim-config.homeModules.default
];

nixvim-config = {
  enable = true;
  aliases = ["v" "vim"];
};

```
