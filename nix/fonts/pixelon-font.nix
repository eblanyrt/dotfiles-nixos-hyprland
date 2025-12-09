{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "pixelon-font";
  version = "1.0";

  # pixelon-font.nix location: /etc/nixos/fonts/
  # pixelon.regular.ttf location: /etc/nixos/assets/fonts/
  src = ../assets/fonts/pixelon.regular.ttf;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp $src $out/share/fonts/truetype/pixelon.regular.ttf
  '';

  meta = with pkgs.lib; {
     description = "Separately packaged pixelon font";
  };
}
