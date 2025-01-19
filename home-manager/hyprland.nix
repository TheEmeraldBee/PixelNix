{
  config,
  libs,
  pkgs,
  ...
}: {
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
          path = "/home/brightonlcox/wallpapers/forest.png";
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

  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_QPA_PLATFORM,wayland"
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "NVD_BACKEND,direct"
      "GDK_BACKEND,wayland"
    ];

    monitor = ",prefered,auto,auto";

    xwayland = {
      enabled = true;
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
        enabled = true;
        size = 3;
        passes = 1;

        vibrancy = 0.1696;
      };
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      smart_split = true;
    };

    input = {
      follow_mouse = 1;
      sensitivity = -0.5;
    };

    misc = {
      disable_splash_rendering = true;
      disable_hyprland_logo = true;

      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
    };

    render = {
      explicit_sync = 0;
      explicit_sync_kms = 0;
      direct_scanout = true;
    };

    cursor = {
      no_hardware_cursors = true;
    };

    "$mod" = "SUPER";
    exec-once = [
      # Run lock on system
      # "hyprlock"

      #
      "hyprctl setcursor Bibata-Modern-Classic 20"
      "swww-daemon && sleep 5sec && swww img /home/brightonlcox/wallpapers/forest.png && swww restore"
      "eww daemon && eww open sidebar"
      "mako"

      # Start Up Applications that are used everywhere.
      "[workspace 2 silent] 1password"
      "[workspace 1 silent] zen"
    ];
    bind =
      [
        "$mod, return, exec, ghostty"
        "$mod, space, exec, ghostty --class AppLauncher -e app-launcher"

        "$mod, X, killactive,"
        "$mod, M, exit,"
        "$mod, P, pin,"

        "$mod, V, togglefloating,"

        "$mod, F, fullscreenstate, 3"

        "$mod, O, exec, grim ~/Screenshots/$(date +'%Y%m%d%H%M.png')"
        "$mod SHIFT, O, exec, grim -g \"$(slurp)\" ~/Screenshots/$(date +'%Y%m%d%H%M.png')"
      ]
      ++ (
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      "float,class:AppLauncher"
      "pin,class:AppLauncher"
      "stayfocused,class:AppLauncher"
    ];
  };
}
