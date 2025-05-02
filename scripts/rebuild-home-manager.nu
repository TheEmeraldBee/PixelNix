try {
  home-manager switch --flake ~/dotfiles#brightonlcox
} catch {
  notify-send -e "Failed to Rebuild Home-Manager Configuration!"
  exit 1
}

notify-send -e "Home-Manager Configuration Rebuilt Ok!"
