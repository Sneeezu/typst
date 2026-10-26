{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "nimbus15";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = "https://mirrors.ctan.org/fonts/nimbus15.zip";
    sha256 = "sha256-T9gMjz13mZMJlExsVNiiLav+gNe/oClPxTzipI/VWVo=";
  };

  buildInputs = [
    pkgs.coreutils
  ];

  installPhase = ''
    runHook preInstall

    install -Dm644 $src/opentype/*.otf -t $out/share/fonts/opentype

    runHook postInstall
  '';
}
