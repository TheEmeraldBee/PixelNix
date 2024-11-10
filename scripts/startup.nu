while (true) {
  print
  let action = ["skip", "a", "da", "n"] | input list "Enter Action [skip (no action, just continue), a (attach), da (delete-all), n (new)]: "

  match $action {
    "skip" => {
      zellij
      break
    }
    "a" => {
      try { zellij ls } catch {
        print "There are no active sessions to attach to."
        continue
      }
      let name = input "Enter session name (nothing: <attach to last>): "
      zellij a
      break
    },
    "da" => {
      zellij da
    }
    "n" => {
      let session = input "Enter Name For Session (nothing: <random>): " | str trim
      if ($session | is-empty) {
        zellij
      } else {
        zellij -s $session
      }
      break
    }
    _ => {
      print "Unrecognized Command. How is this possible?"
    },
  }
}
