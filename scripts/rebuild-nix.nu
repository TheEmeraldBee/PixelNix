try {
  nh os switch ~/dotfiles#nixosConfigurations.($env.FLAKE)
} catch {
  notify-send -u critical -e "Failed to Rebuild Nix Configuration!"
  exit 1
}

notify-send -u low -e "Nix Configuration Rebuilt Ok!"
