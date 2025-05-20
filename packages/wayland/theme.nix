{
  lib,
  pkgs,
  ...
}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-green-compact+rimless,black";
      package = pkgs.catppuccin-gtk.override {
        accents = ["green"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "macchiato";
      };
    };

    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 16;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = lib.mkForce "catppuccin-macchiato-green-compact+rimless,black";
        color-scheme = "prefer-dark";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3"; # Or "gtk2" if you prefer the Qt5/6 GTK2 look
    style = {
      package = pkgs.gtk3; # Or pkgs.gtk2 if using that platformTheme
      name = "gtk3"; # Or "gtk2"
    };
  };
}
