{configScriptPath, ...}: {pkgs, ...}: {
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.__NIX_DARWIN_SET_ENVIRONMENT_DONE = 1

      $env.PATH = [
          $"($env.HOME)/.nix-profile/bin"
          $"/etc/profiles/per-user/($env.USER)/bin"
          "/run/current-system/sw/bin"
          "/nix/var/nix/profiles/default/bin"
          "/usr/local/bin"
          "/usr/bin"
          "/usr/sbin"
          "/bin"
          "/sbin"
      ]
      $env.EDITOR = "VIM"
      $env.NIX_PATH = [
          $"darwin-config=($env.HOME)/.nixpkgs/darwin-configuration.nix"
          "/nix/var/nix/profiles/per-user/root/channels"
      ]
      $env.NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt"
      $env.PAGER = "less -R"
      $env.TERMINFO_DIRS = [
          $"($env.HOME)/.nix-profile/share/terminfo"
          $"/etc/profiles/per-user/($env.USER)/share/terminfo"
          "/run/current-system/sw/share/terminfo"
          "/nix/var/nix/profiles/default/share/terminfo"
          "/usr/share/terminfo"
      ]
      $env.XDG_CONFIG_DIRS = [
          $"($env.HOME)/.nix-profile/etc/xdg"
          $"/etc/profiles/per-user/($env.USER)/etc/xdg"
          "/run/current-system/sw/etc/xdg"
          "/nix/var/nix/profiles/default/etc/xdg"
      ]
      $env.XDG_DATA_DIRS = [
          $"($env.HOME)/.nix-profile/share"
          $"/etc/profiles/per-user/($env.USER)/share"
          "/run/current-system/sw/share"
          "/nix/var/nix/profiles/default/share"
      ]
      $env.TERM = $env.TERM
      $env.NIX_USER_PROFILE_DIR = $"/nix/var/nix/profiles/per-user/($env.USER)"
      $env.NIX_PROFILES = [
          "/nix/var/nix/profiles/default"
          "/run/current-system/sw"
          $"/etc/profiles/per-user/($env.USER)"
          $"($env.HOME)/.nix-profile"
      ]

      if ($"($env.HOME)/.nix-defexpr/channels" | path exists) {
          $env.NIX_PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.nix-defexpr/channels")
      }

      if (false in (ls -l `/nix/var/nix`| where type == dir | where name == "/nix/var/nix/db" | get mode | str contains "w")) {
          $env.NIX_REMOTE = "daemon"
      }


      let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
      }
      $env.config = {
        show_banner: false,
      }

      try {
        $env.GEMINI_API_KEY = open ~/.gemini-key
      } catch {
        $env.GEMINI_API_KEY = (op read op://secrets/gemini-key/password)
        $env.GEMINI_API_KEY | save ~/.gemini-key
      }
    '';
    shellAliases = {
      # Listing Files
      ll = "ls -al";

      # Rust
      bc = "bacon clippy";

      # OS Stuff
      cd = "z";

      # zellix
      zl = "nu ~/.config/zellix/run.nu ~/.config/zellix/example";

      # Editing Configuration
      ne = "nu ${configScriptPath}";

      ai = "aichat";
      ask = "aichat -e";

      e = "nu ~/dotfiles/scripts/startup.nu";
    };
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
}
