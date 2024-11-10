{...}: {
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
  };

  xdg.configFile."yazi" = {
    source = ./yazi;
    recursive = true;
  };
}
