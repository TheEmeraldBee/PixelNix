{
  config,
  pkgs,
  ...
}: {
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      auto_balance = "off";

      focus_follows_mouse = "autoraise";

      window_shadow = "on";

      top_padding = 20;
      bottom_padding = 20;
      left_padding = 20;
      right_padding = 20;
      window_gap = 20;

      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";
    };

    extraConfig = ''
      # rules
      yabai -m rule --add app='Settings' manage=off
      yabai -m rule --add app='Raycast' manage=off

      # Any other arbitrary config here
    '';
  };
}
