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

      ai-env = ''
        if ("GEMINI_API_KEY" not-in $env) { $env.GEMINI_API_KEY = (op read op://secrets/gemini-key/password) }
      '';

      ai = "ai-env; aichat";
      ask = "ai-env; aichat -e";

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
