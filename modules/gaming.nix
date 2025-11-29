{ pkgs, ... }:

{

  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    protonup-ng
    mangohud
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

}
