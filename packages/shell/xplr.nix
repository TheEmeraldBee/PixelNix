{pkgs, ...}: {
  home.packages = with pkgs; [
    xplr
  ];

  programs.xplr = {
    enable = true;
  };

  # xdg.configFile."xplr" = {
  # source = ./xplr;
  # recursive = true;
  # };
}
