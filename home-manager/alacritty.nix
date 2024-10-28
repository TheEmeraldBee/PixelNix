{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.5;
      window.blur = true;

      font.normal.family = "FiraCode Nerd Font";
      font.size = 12.5;

      shell = {
        program = "zsh";
        args = [
          "--login"
          "-c"
          "zellij -l welcome"
        ];
      };
    };
  };
}
