{
  lib,
  appimageTools,
  fetchurl,
}:

let
  pname = "zennotes";
   version = "2.3.0";

  src = fetchurl {
    url = "https://github.com/ZenNotes/zennotes/releases/download/v${version}/ZenNotes-${version}-linux-x86_64.AppImage";
    hash = "sha256-IvFGK7n3KQVGETmt6hQUy+bZNTOCkfuwH8ifl4KTxxw=";
    name = "${pname}-${version}.AppImage";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };

in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = pkgs: [ ]; # add missing libraries here if needed

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/ZenNotes.desktop $out/share/applications/${pname}.desktop
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
  '';

  meta = with lib; {
    description = "Keyboard-first, local-first Markdown notes with vim motions and live preview";
    homepage = "https://github.com/ZenNotes/zennotes";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
