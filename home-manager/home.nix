{ config, libs, pkgs, ...}: {
  imports = [
    ./packages.nix
    ./hyprland.nix
  ];

  nixpkgs.config.allowUnfree = pkgs.lib.mkForce true;
  home = {
    username = "brightonlcox";
    homeDirectory = "/home/brightonlcox";
    stateVersion = "24.11";

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Amber";
      size = 20;
    };

    sessionPath = [
      "/home/brightonlcox/.cargo/bin"
    ];
  };

  gtk = {
    enable = true;
    font.size = 10;
    font.name = "Fira Sans";

    theme = {
      name = "Juno";
      package = pkgs.juno-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 20;
    };

    gtk3.extraConfig = {
      Settings =  ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=Bibata-Modern-Classic
      '';
    };

    
    gtk4.extraConfig = {
      Settings =  ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=Bibata-Modern-Classic
      '';
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };


  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.5;
      window.blur = true;

      font.normal.family = "FiraCode Nerd Font";
      font.size = 12.5;
    };
  };

  programs.git = {
    enable = true;
    userName = "brightonlcox";
    userEmail = "brightonlcox@gmail.com";
    extraConfig = {
      gpg."ssh".program = "/opt/1Password/op-ssh-sign";
    };
  };

  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";
    
      pane_frames = false;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship.enable = true;
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # File Listing
      ls = "eza -l --icons";
      ll = "eza -Alg --icons";
      lf = "eza -lgTL2 --icons";
      lg = "eza -lgTL4 --git-ignore --icons";

      # Zoxide
      cd = "z";

      # Zellij
      e="zellij action new-tab --layout ~/.config/zellij/layouts/ide.kdl";

      # Rust
      cup = "cargo +nightly -Zunstable-options update --breaking";
      bc = "bacon clippy";

      # Dispatching Windows
      open = "hyprctl dispatch exec";
      float = "hyprctl dispatch exec \"[float;]\"";
      perf = "export __NV_PRIME_RENDER_OFFLOAD=1 &&\
                export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0 &&\
                export __GLX_VENDOR_LIBRARY_NAME=nvidia &&\
                export __VK_LAYER_NV_optimus=NVIDIA_only && hyprctl dispatch exec";

      # Nix Shell
      nix-shell = "nix-shell --run zsh";

      # Feh
      img = "hyprctl dispatch -- exec \"[float; size 1920 1080;]\" feh -.";

      # OS Stuff
      osupdate = "sudo nixos-rebuild switch --flake ~/nix-flake#nixos";
      hmupdate = "home-manager switch --flake ~/nix-flake#brightonlcox";
      ne = "hx ~/nix-flake";
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "git" "sudo"
    ];
  };
}
