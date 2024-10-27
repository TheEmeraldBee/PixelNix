{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";

      pane_frames = false;
    };
  };

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      tab_template name="ui" {
          children
      }

      default_tab_template {
          pane name="sidebar"
      }
    }
  '';

  xdg.configFile."zellij/layouts/default.swap.kdl".text = ''
    swap_tiled_layout name="one_pane" {
      ui exact_panes=2 {
        pane split_direction="vertical" {
          pane name="sidebar" size="20%"
          pane name="editor" command="hx"
        }
      }
    }

    swap_tiled_layout name="sidebar_open_two_or_more_panes" {
      ui min_panes=3 {
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
