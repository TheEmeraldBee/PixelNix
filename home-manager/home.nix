{
  config,
  libs,
  pkgs,
  ...
}: {
  news.display = "silent";

  # Define Normal Home Modules
  home = {
    username = "brightonlcox";
    homeDirectory = "/home/brightonlcox";
    stateVersion = "24.11";
  };

  imports = [
    # All package installations defined here.
    ./packages.nix

    # Theme the required applications
    ./theme.nix

    # Programs
    ../packages/alacritty.nix

    # Shell
    (import ../shared/shell.nix {configScriptPath = "~/dotfiles/scripts/edit-nixos.nu";})
    ./git.nix
    ../packages/zellij.nix
    ../packages/starship.nix

    # Applications
    ./app-launcher.nix

    # Home Manager
    ./hyprland.nix
  ];
}
