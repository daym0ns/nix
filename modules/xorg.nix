{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    ungoogled-chromium
    alacritty
    gparted
    vesktop
    xclip
  ];
}
