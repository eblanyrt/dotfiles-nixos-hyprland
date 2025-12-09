{
  stdenvNoCC,
  qt6,
  lib,
  fetchFromGitHub,
  formats,
  theme ? "old_tales",
  themeConfig ? null,
}:
let
  overwriteConfig = (formats.ini {}).generate "${theme}.conf.user" themeConfig;
in
  stdenvNoCC.mkDerivation rec {
    name = "sddm-astronaut-oldtales";

    src = fetchFromGitHub {
      owner = "eblanyrt";
      repo = "sddm-astronaut-theme";
      rev = "a0d2b735e75021a7b2fe9a134794e5ff7d24e570";
      #hash = "sha256-JeegPJgl9bk2GUAB1fARczo8znbqTK03+5Q3Oo69u2w=";
      hash = "sha256-2yDcSYFDt54sqIZC2Fo2Rxfs6feAJQm+mKX7shTYnU0=";
    };

    propagatedUserEnvPkgs = with qt6; [qtsvg qtvirtualkeyboard qtmultimedia];

    dontBuild = true;

    dontWrapQtApps = true;

    installPhase = ''
      themeDir="$out/share/sddm/themes/${name}"

      mkdir -p $themeDir
      cp -r $src/* $themeDir

      install -dm755 "$out/share/fonts"
      cp -r $themeDir/Fonts/* $out/share/fonts/

      # Update metadata.desktop to load the chosen theme.
      substituteInPlace "$themeDir/metadata.desktop" \
        --replace-fail "ConfigFile=Themes/astronaut.conf" "ConfigFile=Themes/${theme}.conf"

      # Create theme.conf.user of the selected theme. To overwrite its configuration.
      ${lib.optionalString (lib.isAttrs themeConfig) ''
        install -dm755 "$themeDir/Themes"
        cp ${overwriteConfig} $themeDir/Themes/${theme}.conf.user
        ''}
    '';

    meta = with lib; {
      description = "Forked sddm-astronaut-theme, with an additional theme called 'old_tales'";
      homepage = "https://github.com/eblanyrt/sddm-astronaut-theme.git";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  }
