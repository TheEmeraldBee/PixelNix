{pkgs, ...}: {
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij" = {
    source = ./zellij;
    recursive = true;
  };
}
