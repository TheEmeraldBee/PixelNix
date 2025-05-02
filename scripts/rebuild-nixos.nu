try {
  /run/wrappers/bin/sudo nixos-rebuild switch --flake ~/dotfiles#nixos
} catch {
  notify-send -e "Failed to Rebuild Nix Configuration!"
  exit 1
}

notify-send -e "Nix Configuration Rebuilt Ok!"
