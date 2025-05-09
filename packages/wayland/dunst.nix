{pkgs, ...}: {
  home.packages = with pkgs; [
    libnotify
  ];
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "none";

        corner_radius = 10;

        scale = 0;
        notification_limit = 10;

        font = "FiraCode Nerd Font Mono";

        format = ''%s\n%b'';

        alignment = "left";
        vertical_alignment = "center";

        frame_width = 1;
        horizontal_padding = 8;
        text_icon_padding = 12;
        padding = 10;
        separator_height = 6;

        icon_corner_radius = 0;
        icon_corners = "all";
      };

      urgency_low = {
        foreground = "#ffffff";
        background = "#222222";
        highlight = "#722ae6, #e4b5cb";
        timeout = 20;
      };

      urgency_normal = {
        background = "#222222";
        foreground = "#ffffff";
        frame_color = "#5e5086";
        highlight = "#722ae6, #e4b5cb";
        timeout = 20;
        override_pause_level = 30;
      };

      urgency_critical = {
        background = "#222222";
        foreground = "#ffffff";
        frame_color = "#d54e53";
        highlight = "#d54e53, #f0f0f0";
        timeout = 60;
        override_pause_level = 60;
      };

      play_sound = {
        # Play a sound on all notifications
        summary = "*";
        script = "~/dotfiles/packages/dunst/scripts/playsound.sh";
      };
    };
  };
}
