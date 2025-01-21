{...}: {
  news.display = "silent";

  home.stateVersion = "24.11";

  imports = [
    # Local Packages
    ./packages.nix

    # Window Manager
    ../packages/aerospace.nix

    ../shared/packages.nix

    # Terminal
    ../packages/ghostty.nix
    ../packages/starship.nix
    ../packages/zellij.nix

    ../packages/helix.nix
    ../packages/zellix.nix

    # Shell
    (import ../shared/shell.nix {configScriptPath = "~/dotfiles/scripts/edit-macos.nu";})
  ];

  programs.nushell.extraEnv = ''
    $env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
  '';
}
