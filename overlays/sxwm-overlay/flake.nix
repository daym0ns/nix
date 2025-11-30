{
  description = "sxwm overlay for nixpkgs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
  {
    nixpkgs.overlays.default = final: prev: {
      sxwm = prev.stdenv.mkDerivation {
        pname = "sxwm";
        version = "1.7";

        src = prev.fetchFromGitHub {
          owner = "uint23";
          repo = "sxwm";
          rev = "v1.7";
          sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
          fetchSubmodules = false;
          deepClone = false;
        };

        installPhase = ''
          make clean
          make PREFIX=$out install
        '';

        buildInputs = [
          prev.xorg.libX11
          prev.xorg.libXinerama
        ];

        nativeBuildInputs = [
          prev.libgcc
          prev.gnumake
        ];
      };
    };
  };
}
