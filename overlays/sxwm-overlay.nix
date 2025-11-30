{ super, ... }:
{
  sxwm = super.stdenv.mkDerivation {

    pname = "sxwm";
    version = "1.7";

    src = super.fetchFromGithub {
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
      super.xorg.libX11
      super.xorg.libXinerama
    ];

    nativeBuildInputs = [
      super.libgcc
      super.gnumake
    ];

  };
}
