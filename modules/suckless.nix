{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (pkgs.dmenu.overrideAttrs (_: {
      src = ../src/dmenu;
      patches = [ ];
    }))
  ];
}
