{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";

      pane_frames = false;
    };
  };

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      tab_template name="ui" {
          children
          pane size=1 borderless=true {
            plugin location="zellij:compact-bar"
          }
      }

      default_tab_template {
          pane name="sidebar"
          pane size=1 borderless=true {
            plugin location="zellij:compact-bar"
          }
      }
    }
  '';

  xdg.configFile."zellij/layouts/default.swap.kdl".text = ''
    swap_tiled_layout name="one_pane" {
      ui exact_panes=3 {
        pane split_direction="vertical" {
          pane name="sidebar" size="20%"
          pane name="editor" command="hx"
        }
      }
    }

    swap_tiled_layout name="sidebar_open_two_or_more_panes" {
      ui min_panes=4 {
        pane split_direction="vertical" {
          pane name="sidebar" size="20%"
          pane split_direction="horizontal" {
            pane name="editor" command="hx" size="70%"

            pane stacked=true { children; }
          }
        }
      }
    }

  '';
}
