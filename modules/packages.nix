{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    ntfs3g
    glow
    feh
    htop
    git
    nix-prefetch-scripts
  ];
}
