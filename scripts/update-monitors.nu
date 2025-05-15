let connected = (hyprctl monitors -j | from json | get name)

# Kill Pretty Background Thing
nu ~/dotfiles/scripts/swww-rotate-utils.nu kill

eww close-all
swww kill

if ($connected | any { |m| $m == "HDMI-A-3" }) {
  hyprctl dispatch moveworkspacetomonitor 6 HDMI-A-3
  hyprctl dispatch moveworkspacetomonitor 8 HDMI-A-3

  for i in 5..0 {
    hyprctl dispatch moveworkspacetomonitor $i HDMI-A-3
  }

  eww open sidebar --screen HDMI-A-3
} else if ($connected | any { |m| $m == "DP-3" }) {
  hyprctl dispatch moveworkspacetomonitor 6 eDP-2
  hyprctl dispatch moveworkspacetomonitor 8 eDP-2

  for i in 5..0 {
    hyprctl dispatch moveworkspacetomonitor $i DP-3
  }
  eww open sidebar --screen DP-3
} else {
  hyprctl dispatch moveworkspacetomonitor 6 eDP-2
  hyprctl dispatch moveworkspacetomonitor 8 eDP-2

  for i in 5..0 {
    hyprctl dispatch moveworkspacetomonitor $i eDP-2
  }

  eww open sidebar --screen eDP-2
}

hyprctl dispatch exec swww-daemon

sleep 500ms

nu ~/dotfiles/scripts/swww-rotate-utils.nu start 5min
