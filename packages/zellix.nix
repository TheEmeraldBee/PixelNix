{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "8d20ecde0c34821eadce3e1a377e4115a08213a8";
    };
    recursive = true;
  };
}
