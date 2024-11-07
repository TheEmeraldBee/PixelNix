{pkgs, ...}: {
  news.display = "silent";

  home.stateVersion = "24.11";

  imports = [
    ../shared/packages.nix

    # Terminal
    ../packages/alacritty.nix
    ../packages/starship.nix
    ../packages/zellij.nix

    # Shell
    (import ../shared/shell.nix {configScriptPath = "~/dotfiles/scripts/edit-macos.nu";})
  ];
}
