{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    ntfs3g
    git
    nix-prefetch-scripts
  ];
}
