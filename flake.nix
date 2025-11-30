{
  description = "NixOS dev setup";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sxwm-overlay.url = "github:daym0ns/sxwm-nixos-overlay";

  };

  outputs =
    { self, nixpkgs, home-manager, ... }:

    let
      pkgsOverlay = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ self.inputs.sxwm-overlay.nixpkgs.overlays.default ];
        config = {
            allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.nixdev = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        pkgs = pkgsOverlay;
        modules = [
          ./configuration.nix
          ./modules/amd.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
	            useGlobalPkgs = true;
              users.pizza = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
