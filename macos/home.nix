{pkgs, ...}: {
  home.packages = with pkgs; [
    # Mac App Launcher
    raycast
  ];

  news.display = "silent";

  home.stateVersion = "24.11";

  imports = [
    ../shared/packages.nix

    (import ../shared/shell.nix {configScriptPath = "~/dotfiles/scripts/edit-macos.nu";})
  ];
}
