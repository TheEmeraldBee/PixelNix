{
  configScriptPath,
  additionalConfig,
  ...
}: {pkgs, ...}: {
  programs.nushell = {
    enable = true;
    extraConfig = ''
      ${additionalConfig}
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
      try {
        $env.GROQ_API_KEY = open ~/.groq-key
      } catch {
        $env.GROQ_API_KEY = (op read op://secrets/groq-key/password)
        $env.GROQ_API_KEY | save ~/.groq-key
      }
      try {
        $env.RPG_BOT_KEY = open ~/.rpg-bot
      } catch {
        $env.RPG_BOT_KEY = (op read op://secrets/rpg-bot/password)
        $env.RPG_BOT_KEY | save ~/.rpg-bot
      }

      $env.EDITOR = "hx"

      def --env d [...args] {
        let inputs = yazi --chooser-file=/dev/stdout ../ | each {|line| $line} | split row "\n"

        mut dir = if (($inputs | length) == 0) {
          print $"(ansi gb)No Folder Selected. Using `pwd`.(ansi reset)"
          pwd
        } else {
          $inputs | get 0
        }

        while (($dir | path type) != dir) {
          $dir = $dir | path dirname
          print $"(ansi rb)Going back directory because picked item is file and not directory(ansi reset)" $"(ansi blue_bold)New Directory: ($dir)"
        }

        cd $dir

        break
      }

      if ("ZELLIJ_SESSION_NAME" in $env) {
        print "In zellij session, not making another"
      } else {
        nu ~/dotfiles/scripts/startup.nu
        exit
      }
    '';
    shellAliases = {
      ls = "eza -l --icons";
      ll = "eza -Alg --icons";
      lf = "eza -lgTL2 --icons";
      lg = "eza -lgTL4 --git-ignore --icons";

      # Rust
      bc = "bacon clippy";

      # OS Stuff
      cd = "z";
      ci = "zi";

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
