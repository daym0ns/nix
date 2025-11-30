{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    ntfs3g
    glow
    htop
    git
    nix-prefetch-scripts
  ];
}
