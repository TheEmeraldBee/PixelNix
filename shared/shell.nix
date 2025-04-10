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

      # Zellix
      zl = "nu ~/.config/zellix/run.nu ~/.config/zellix";

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
