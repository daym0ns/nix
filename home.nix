{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nix/config";
  configs = {
    alacritty = "alacritty";
    nvim = "nvim";
  };
in

{

  imports = [
    ./modules/suckless.nix
    ./modules/neovim.nix
    ./modules/dev.nix
  ];

  home.username = "pizza";
  home.homeDirectory = "/home/pizza";
  home.stateVersion = "25.05";

  home.file.".dwm/autostart.sh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/src/dwm/autostart/autostart.sh";
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  programs.bash = {
    enable = true;
  };
}
