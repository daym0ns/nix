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


  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    xkb.layout = "pl";
    displayManager = {
      lightdm.enable = true;
    };
    windowManager = {
      dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
          src = ../src/dwm;
        };
      };
    };
  };
}
