{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.5;
      window.blur = true;
      window.decorations = "buttonless";

      font.normal.family = "FiraCode Nerd Font";
      font.size = 12.5;
    };
  };
}
