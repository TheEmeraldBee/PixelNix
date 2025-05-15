try {
  home-manager switch --flake ~/dotfiles#($env.FLAKE)
} catch {
  notify-send -u critical -e "Failed to Rebuild Home-Manager Configuration!"
  exit 1
}

nu ~/dotfiles/scripts/swww-rotate-utils.nu kill
swww kill
sleep 500ms
hyprctl dispatch exec swww-daemon
sleep 500ms
nu ~/dotfiles/scripts/swww-rotate-utils.nu start 5min

notify-send -u low -e "Home-Manager Configuration Rebuilt Ok!"
