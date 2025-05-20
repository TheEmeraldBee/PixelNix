{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-green-compact+rimless";
      package = pkgs.catppuccin-gtk.override {
        accents = ["green"];
        size = "compact";
        tweaks = ["rimless"];
        variant = "macchiato";
      };
    };
  };

  # dconf = {
  #   enable = true;
  #   settings = {
  #     "org/gnome/desktop/interface" = {
  #       gtk-theme = lib.mkForce "catppuccin-macchiato-green-compact+rimless";
  #       color-scheme = "prefer-dark";
  #       cursor-theme = "catppuccin-mocha-dark-cursors";
  #       cursor-size = 20;
  #     };
  #   };
  # };

  # qt = {
  #   enable = true;
  #   platformTheme.name = "gtk3"; # Or "gtk2" if you prefer the Qt5/6 GTK2 look
  #   style = {
  #     package = pkgs.gtk3; # Or pkgs.gtk2 if using that platformTheme
  #     name = "gtk3"; # Or "gtk2"
  #   };
  # };
}
