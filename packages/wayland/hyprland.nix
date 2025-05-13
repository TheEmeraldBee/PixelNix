{envVars, ...}: {
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    hypridle # Checks for idling machine
    hyprlock # Makes machine lockable

    # Screenshots
    grim
    slurp

    wl-clipboard
  ];

  xdg.configFile."hypr/scripts" = {
    source = ./hyprland/scripts;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {};

      background = [
        {
          path = "/home/brightonlcox/dotfiles/assets/wallpapers/forest.png";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
          shadow_passes = 2;
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      ${builtins.readFile ./hyprland/config.conf}
    '';

    settings = {
      env =
        [
          "MOZ_ENABLE_WAYLAND,1"
          "AQ_DRM_DEVICES,/dev/dri/card2:/dev/dri/card1"
        ]
        ++ envVars;

      animations = {
        enabled = 1;
        animation = [
          "borderangle,0"
        ];
      };

      monitor = [
        ",prefered,auto,1.5"
        "eDP-2,prefered,auto,1.25"
      ];

      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = false;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };

        shadow.enabled = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        smart_split = true;
      };

      input = {
        follow_mouse = 1;
        sensitivity = -0.2;
        natural_scroll = true;

        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          scroll_factor = 0.3;
          clickfinger_behavior = true;
        };
      };

      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;

        vfr = true;
      };

      render = {
        explicit_sync = 0;
        explicit_sync_kms = 0;
        direct_scanout = true;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      workspace = [
        "r[1-5], persistent:1, monitor:DP-3"
        "6, persistent:1, monitor:eDP-2"
        "8, persistent:1, monitor:eDP-2"
      ];

      "$mod" = "SUPER";
      exec-once = [
        # Run lock on system startup
        "hyprlock"

        #
        "hyprctl setcursor Bibata-Modern-Classic 20"
        "swww-daemon && sleep 5sec && swww img /home/brightonlcox/wallpapers/forest.png && swww restore"
        "eww daemon && eww open sidebar"

        # Start Up Applications that are used everywhere.
        "[workspace 1 silent] zen" # Web-Browser
        "[workspace 4 silent] discord" # Messaging
        "[workspace 2 silent] steam -silent" # Gaming

        "[workspace 5 silent] 1password" # Password Manager

        "[workspace special silent] ghostty" # Floating Terminal
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "workspace 4, class:^(discord)$"
      ];
    };
  };
}
