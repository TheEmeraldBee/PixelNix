{...}: let
  rootPath = ../../.;
in {
  news.display = "silent";

  # Define Normal Home Modules
  home = {
    username = "brightonlcox";
    homeDirectory = "/home/brightonlcox";
    stateVersion = "24.11";
  };

  imports = [
    ############
    # Packages #
    ############
    # Applications
    (rootPath + /packages/applications/discord.nix) # Chatting
    (rootPath + /packages/applications/ghostty.nix) # Terminal
    (rootPath + /packages/applications/prismlauncher.nix) # Minecraft
    (rootPath + /packages/applications/feh.nix) # Image Viewer
    (rootPath + /packages/applications/pavu.nix) # Audio Control
    (rootPath + /packages/applications/zen.nix) # Browser
    (rootPath + /packages/applications/olympus.nix) # Celeste Mods
    (rootPath + /packages/applications/obsidian.nix) # Note Taking

    # Shell
    (import (rootPath + /packages/shell/nushell.nix) {
      flake = "nvidia_pc";
    })

    (rootPath + /packages/shell/devenv.nix) # Development Environment Tools

    (rootPath + /packages/shell/wally.nix) # ZSA Keyboard

    (rootPath + /packages/shell/aichat.nix) # AI
    (rootPath + /packages/shell/direnv.nix) # Auto setup when entering directory

    (rootPath + /packages/shell/ferrite.nix) # Makefile Runner

    (rootPath + /packages/shell/git.nix) # VCS
    (rootPath + /packages/shell/jujutsu.nix) # Improved Git UX

    (rootPath + /packages/shell/helix.nix) # Editor
    (rootPath + /packages/shell/starship.nix) # Prompt
    (rootPath + /packages/shell/yazi.nix) # File Explorer
    (rootPath + /packages/shell/zellij.nix) # Multiplexer

    # Wayland
    (import (rootPath + /packages/wayland/hyprland.nix) {
      envVars = [
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
    }) # Window Manager

    (rootPath + /packages/wayland/theme.nix) # Make things pretty

    (rootPath + /packages/wayland/dunst.nix) # Notifications
    (rootPath + /packages/wayland/eww.nix) # Sidebar
    (rootPath + /packages/wayland/swww.nix) # Wallpaper

    (rootPath + /packages/wayland/ranch.nix) # App Launcher
  ];
}
