{pkgs, ...}: {
  home.packages = with pkgs; [
    direnv
  ];

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
  };
}
