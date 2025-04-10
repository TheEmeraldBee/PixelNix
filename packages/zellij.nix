{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      on_force_close = "quit";
      theme = "catppuccin-mocha";

      pane_frames = false;
    };
  };

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      default_tab_template {
          pane
          pane size=1 borderless=true {
            plugin location="zellij:compact-bar"
          }
      }
    }
  '';
}
