# On start, attach to, create, or delete zellij sessions.

if (zellij ls | str contains current) {
  print "You are currently in a zellij session. Nested Sessions Aren't Supported"
  exit 0
}

while (true) {
  print

  let sessions = zellij ls -s 
    | each { |x| $x } 
    | split row "\n"
    | drop 1

  let visual_sessions = zellij ls o+e>| each {|line| $line}
    | split row "\n" 
    | drop 1 
    | filter {|x| str trim | is-not-empty}

  let action = [
      $"(ansi gb)1. new session(ansi reset)", 
      $"(ansi grey)2. list sessions(ansi reset)", 
      $"(ansi blue_bold)3. attach(ansi reset)", 
      $"(ansi rb)4. delete session(ansi reset)"
      $"(ansi pb)5. delete all inactive sessions(ansi reset)"
    ] | input list $"(ansi cb)Which action?(ansi reset)" -i

  match $action {
    0 => {
      let inputs = yazi --chooser-file=/dev/stdout ../ | each {|line| $line} | split row "\n"

      mut dir = if (($inputs | length) == 0) {
        print $"(ansi gb)No Folder Selected. Using `pwd`.(ansi reset)"
        pwd
      } else {
        $inputs | get 0
      }

      while (($dir | path type) != dir) {
        $dir = $dir | path dirname
        print $"(ansi rb)Going back directory because picked item is file and not directory(ansi reset)" $"(ansi blue_bold)New Directory: ($dir)"
      }

      cd $dir

      let session = input $"(ansi cb)Enter Name For Session \(nothing: <random>\): (ansi reset)" | str trim
      if ($session | is-empty) {
        zellij
      } else {
        zellij -s $session
      }
      break
    }
    1 => {
      try { let _ = zellij ls } catch {
        print $"(ansi rb)There are no active sessions to attach to.(ansi reset)"
        continue
      }

      print "Sessions:" $visual_sessions
    }
    2 => {
      try { let _ = zellij ls } catch {
        print $"(ansi rb)There are no active sessions to attach to.(ansi reset)"
        continue
      }

      let name = $visual_sessions | input list $"(ansi cb)Which Session Would You Like To Use?(ansi reset)" -i

      if ($name | is-empty) {
        break
      }

      let attach = $sessions | get $name
      
      zellij a $attach
      break
    },
    3 => {
      try { let _ = zellij ls } catch {
        print $"(ansi rb)There are no active sessions to attach to.(ansi reset)"
        continue
      }

      let name = $visual_sessions | input list $"(ansi cb)Which Session Would You Like To Delete?(ansi reset)" -i

      if ($name | is-empty) {
        continue
      }

      let delete = $sessions | get $name

      try { let _ = zellij d $delete } catch {
        let val = input $"(ansi cb)This session is active. Are you sure? \(Y/n\)(ansi reset)" -n 1 -s | str downcase
        print ""
        if ($val == "y") {
          zellij d --force $delete
        } else {
          print $"(ansi rb)OK, Not Deleting(ansi reset)"
        }
      }
    }
    4 => {
      zellij da
    }
    _ => {
      break
    },
  }
}
