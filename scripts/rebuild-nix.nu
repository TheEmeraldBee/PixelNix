try {
  /run/wrappers/bin/sudo nixos-rebuild switch --flake ~/dotfiles#($env.FLAKE)
} catch {
  notify-send -u critical -e "Failed to Rebuild Nix Configuration!"
  exit 1
}

notify-send -u low -e "Nix Configuration Rebuilt Ok!"
