try {
  home-manager switch --flake ~/dotfiles#($env.FLAKE)
} catch {
  notify-send -u critical -e "Failed to Rebuild Home-Manager Configuration!"
  exit 1
}

swww kill
sleep 500ms
hyprctl dispatch exec swww-daemon
sleep 500ms
swww img ~/dotfiles/assets/wallpapers/forest.png

notify-send -u low -e "Home-Manager Configuration Rebuilt Ok!"
