# 
# The purpose of this file is to, on start of my shell, to create a zellij session, or run other zellij actions.
#
# By: Brighton (TheEmeraldBee)

if (zellij ls | str contains current) {
  print "You are currently in a zellij session. Nested Sessions Aren't Supported"
  exit 0
}

while (true) {
  print

  let action = [$"(ansi gb)1. new session(ansi reset)", $"(ansi blue_bold)2. attach(ansi reset)", $"(ansi rb)3. delete sessions(ansi reset)"] | input list $"(ansi cb)Which action?(ansi reset)" -i

  match $action {
    0 => {
      let inputs = yazi --chooser-file=/dev/stdout | each {|line| $line} | split row "\n"

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
      try { let sessions = zellij ls } catch {
        print $"(ansi rb)There are no active sessions to attach to.(ansi reset)"
        continue
      }

      let actual_attach_list = zellij ls -s 
            | each { |x| $x } 
            | split row "\n"
            | drop 1
      let input_list = zellij ls o+e>| each {|line| $line} 
            | split row "\n" 
            | drop 1 
            | filter {|x| str trim | is-not-empty}
            
      let name = $input_list | input list $"(ansi cb)Which Session Would You Like To Use?(ansi reset)" -i

      if ($name | is-empty) {
        break
      }

      let attach = $actual_attach_list | get $name
      
      zellij a $attach
      break
    },
    2 => {
      zellij da
    }
    _ => {
      break
    },
  }
}
