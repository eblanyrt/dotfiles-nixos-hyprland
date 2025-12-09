{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "espacion-font";
  version = "1.0";

  # espacion-font.nix location: /etc/nixos/fonts/
  # ESPACION.ttf location: /etc/nixos/assets/fonts/
  src = ../assets/fonts/ESPACION.ttf;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp $src $out/share/fonts/truetype/ESPACION.ttf
  '';

  meta = with pkgs.lib; {
     description = "Separately packaged ESPACION font";
  };
}
