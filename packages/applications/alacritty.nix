{pkgs, ...}: {
  home.packages = with pkgs; [
    alacritty
  ];

  xdg.configFile."alacritty" = {
    source = ./alacritty;
    recursive = true;
  };
}
