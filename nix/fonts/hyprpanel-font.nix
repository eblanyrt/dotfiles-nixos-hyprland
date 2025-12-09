{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "hyprpanel-fonts";
  version = "1.0";

  src = ../assets/fonts/JetBrainsMonoNerdFontPropo;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp ./* $out/share/fonts/truetype/
  '';

  meta = with pkgs.lib; {
    description = "Separately packaged fonts for HyprPanel";
  };
}
