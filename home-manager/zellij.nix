{ ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";
    
      pane_frames = false;
    };
  };
}
