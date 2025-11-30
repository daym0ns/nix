{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/gaming.nix
    ./modules/automount.nix
    ./modules/packages.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.sessionVariables = {
    NIX_BUILD_CORES = "12";
  };

  networking.hostName = "nixdev";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

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
          src = ./src/dwm;
        };
      };
    };
  };

  users.users.pizza = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05";

}
