{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = pkgs.lib.mkForce true;

  news.display = "silent";

  home.stateVersion = "24.11";
  
  imports = [
    # ../shared/packages.nix

    (import ../shared/shell.nix { configScriptPath = "~/dotfiles/scripts/edit-macos.nu"; })
  ];
}
