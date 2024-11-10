# 
# The purpose of this file is to, on start of my shell, to create a zellij session.
#
# By: Brighton (TheEmeraldBee)

let inputs = yazi --chooser-file=/dev/stdout | each {|line| $line} | split row "\n"

mut dir = if (($inputs | length) == 0) {
  print "No Folder Selected. Using `pwd`."
  pwd
} else {
  $inputs | get 0
}

while (($dir | path type) != dir) {
  $dir = $dir | path dirname
  print "Going back directory because picked item is file and not directory" "New Directory: " $dir
}

cd $dir

while (true) {
  print

  let action = ["new session", "attach", "delete sessions"] | input list "Which action?"

  match $action {
    "new session" => {
      let session = input "Enter Name For Session (nothing: <random>): " | str trim
      if ($session | is-empty) {
        zellij
      } else {
        zellij -s $session
      }
      break
    }
    "attach" => {
      try { zellij ls } catch {
        print "There are no active sessions to attach to."
        continue
      }
      let name = input "Enter session name (nothing: <attach to last>): "
      zellij a
      break
    },
    "delete sessions" => {
      zellij da
    }
    _ => {
      break
    },
  }
}
