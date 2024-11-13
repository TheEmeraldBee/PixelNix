{configScriptPath, ...}: {pkgs, ...}: {
  programs.nushell = {
    enable = true;
    extraConfig = ''
      let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
      }
      $env.config = {
        show_banner: false,
      }
    '';
    shellAliases = {
      # Listing Files
      ll = "ls -al";

      # Rust
      bc = "bacon clippy";

      # OS Stuff
      cd = "z";

      # Helix
      zx = "nu ~/.config/zellix/run.nu ~/.config/zellix/example";

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
