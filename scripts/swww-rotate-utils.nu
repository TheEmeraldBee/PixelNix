def main [] {}

# Kills all swww-rotate processes
def "main kill" [] {
  ps -l | where command =~ "swww-rotate.nu" | each { |x| kill $x.pid }
}

def "main start" [delay: duration] {
  hyprctl dispatch exec -- nu ~/dotfiles/scripts/swww-rotate.nu ($delay | to text)
}
