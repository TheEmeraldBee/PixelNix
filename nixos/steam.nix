{pkgs, ...}: {
  hardware.steam-hardware.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;

    package = pkgs.steam.override {
      extraLibraries = pkgs:
        with pkgs; [
          openssl
          nghttp2
          libidn2
          rtmpdump
          libpsl
          curl
          krb5
          keyutils
        ];
    };
  };

  programs.gamescope.enable = true;

  programs.alvr = {
    enable = true;
    openFirewall = true;
  };
}
