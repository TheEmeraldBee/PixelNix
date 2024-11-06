{configScriptPath, ...}: {pkgs, ...}: {
  programs.nushell = {
    enable = true;
    shellAliases = {
      # Listing Files
      ll = "ls -al";

      # Rust
      bc = "bacon clippy";

      # OS Stuff
      cd = "z";

      # Editing Configuration
      ne = "nu ${configScriptPath}";
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
