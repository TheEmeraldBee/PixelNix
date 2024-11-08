{...}: {
  home.file.aerospace = {
    target = ".aerospace.toml";
    text = ''
      after-startup-command = [
        'exec-and-forget borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=5.0'
      ]

      [gaps]
      inner.horizontal = 15
      inner.vertical = 15
      outer.left = 15
      outer.bottom = 15
      outer.top = 15
      outer.right = 15

      [mode.main.binding]
      alt-f = 'fullscreen'

      alt-d = 'layout v_accordion tiles'
      alt-shift-f = 'layout floating tiling'

      alt-1 = 'workspace 1'
      alt-2 = 'workspace 2'
      alt-3 = 'workspace 3'
      alt-4 = 'workspace 4'
      alt-5 = 'workspace 5'
      alt-6 = 'workspace 6'
      alt-7 = 'workspace 7'
      alt-8 = 'workspace 8'
      alt-9 = 'workspace 9'
      alt-0 = 'workspace 10'

      alt-shift-1 = 'move-node-to-workspace 1'
      alt-shift-2 = 'move-node-to-workspace 2'
      alt-shift-3 = 'move-node-to-workspace 3'
      alt-shift-4 = 'move-node-to-workspace 4'
      alt-shift-5 = 'move-node-to-workspace 5'
      alt-shift-6 = 'move-node-to-workspace 6'
      alt-shift-7 = 'move-node-to-workspace 7'
      alt-shift-8 = 'move-node-to-workspace 8'
      alt-shift-9 = 'move-node-to-workspace 9'
      alt-shift-0 = 'move-node-to-workspace 10'
    '';
  };
}
