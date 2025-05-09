{pkgs, ...}: {
  home.packages = with pkgs; [
    aichat
  ];

  xdg.configFile."aichat" = {
    source = ./aichat;
    recursive = true;
  };
}
