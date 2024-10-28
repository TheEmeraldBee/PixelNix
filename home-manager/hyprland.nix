{
  config,
  libs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_QPA_PLATFORM,wayland"
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "NVD_BACKEND,direct"
      "GDK_BACKEND,wayland"
      # "SDL_BACKEND,wayland"
    ];

    monitor = ",preferred,auto,auto";

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

      allow_tearing = true;

      layout = "dwindle";
    };

    decoration = {
      rounding = 10;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";

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
    };

    cursor = {
      no_hardware_cursors = true;
    };

    "$mod" = "SUPER";
    exec-once = [
      "hyprctl setcursor Bibata-Modern-Classic 20"
      "swww-daemon"
      "eww daemon && eww open sidebar"
      "mako"
    ];
    bind =
      [
        "$mod, return, exec, alacritty"
        "$mod, space, exec, alacritty --class AppLauncher -e app-launcher"

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

      "immediate, class:(.*)$"
    ];
  };
}
