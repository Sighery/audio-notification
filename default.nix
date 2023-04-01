{ lib, stdenv, fetchFromGitHub, bash, coreutils, gawk, wireplumber }:


stdenv.mkDerivation rec {
  pname = "audio-notification";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "Sighery";
    repo = "audio-notification";
    rev = "36c76937673a9c05782e21c428bf2ca1ca0e0d78";
    sha256 = "PcNzAg3bLe5ysWFAvFK1IDVggtGMDl7FfspK4UV89Ms=";
  };

  buildInputs = [ coreutils bash gawk wireplumber ];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp -a audio_notification.sh $out/bin/audio-notification
    chmod +x $out/bin/audio-notification
  '';

  meta = with lib; {
    description = "Notification with current audio status";
    homepage = "https://github.com/Sighery/audio-notification";
    platforms = with lib.platforms; linux;
  };
}
