let connected = (hyprctl monitors -j | from json | get name)

eww close-all
swww kill

if ($connected | any { |m| $m == "DP-3" }) {
  eww open sidebar --screen DP-3
} else {
  eww open sidebar --screen eDP-2
}

hyprctl dispatch exec swww-daemon
