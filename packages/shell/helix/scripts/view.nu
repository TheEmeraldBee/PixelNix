def main [file] {
  let extension = $file | path parse | get extension
  match $extension {
    "md" => { glow -t $file }
    "html" => { firefox --new-window $file }
    _ => {
      print "no opener for this filetype descrbed, using see";
      see $file

      print "Press <Any> to exit"
      input -n 1 -s
    }
  }
}
