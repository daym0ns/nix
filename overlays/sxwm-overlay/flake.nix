{
  description = "sxwm overlay for nixpkgs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
  {
    nixpkgs.overlays.default = final: prev: {
      sxwm = prev.stdenv.mkDerivation {
        pname = "sxwm";
        version = "1.7";

        src = prev.fetchgit {
          url = "https://github.com/uint23/sxwm.git";
          rev = "v1.7";
          sha256 = "sha256-Gytop4lYkQdVaYXWyXmlHotEFnaA0O8CZUmqfIe8X2w=";
          fetchSubmodules = false;
          deepClone = false;
        };

        installPhase = ''
          make clean
          make PREFIX=$out install
          cat > $out/share/xsessions/sxwm.desktop <<EOF
[Desktop Entry]
Name=SXWM
Comment=SXWM Window Manager
Exec=$out/bin/sxwm
Type=XSession
EOF
        '';

        buildInputs = [
          prev.xorg.libX11
          prev.xorg.libXinerama
          prev.xorg.libXcursor
        ];

        nativeBuildInputs = [
          prev.libgcc
          prev.gnumake
        ];

        passthru.providedSessions = [ "sxwm" ];

        meta = with prev.lib; {
          description = "SXWM window manager";
          platforms = platforms.linux;
        };

      };
    };
  };
}
