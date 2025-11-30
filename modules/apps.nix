{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    ungoogled-chromium
    alacritty
    gparted
    vesktop
    xclip

    (pkgs.dmenu.overrideAttrs (_: {
      src = ../src/dmenu;
    }))

  ];

}
