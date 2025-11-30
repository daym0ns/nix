{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    ntfs3g
    glow
    git
    nix-prefetch-scripts
  ];
}
