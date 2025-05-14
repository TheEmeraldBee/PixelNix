use std/dirs shells-aliases *

def main [wait_time: duration] {
  # Get all monitors (assumes that monitor 2 is to the right of 1)
  let monitors = hyprctl monitors -j | from json | get name | reverse | enumerate
  # Get all wallpaper images and shuffle them around
  enter ~/dotfiles/assets/wallpapers
  let files = ls **/* | where type == "file" | shuffle
  let files_len = $files | length
  mut idx = 0
  loop {
    let inner_id = $idx
    $monitors | each { |x|
      let idx = ($inner_id - $x.index) mod ($files_len)
      let path = "/home/brightonlcox/dotfiles/assets/wallpapers/" + ($files | get $idx | get name)
      swww img --transition-type wipe --outputs $x.item $path
    }

    $idx += 1
    if ($idx >= ($files | length)) {
      $idx = 0
    }

    sleep $wait_time
  }
}
