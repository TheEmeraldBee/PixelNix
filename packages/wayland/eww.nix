{theme}: {pkgs, ...}: {
  home.packages = with pkgs; [
    eww
  ];

  xdg.configFile."eww" = {
    source = ./eww;
    recursive = true;
  };
}
