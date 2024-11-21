{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "193cd7caf9c80aafa5b72435cf7bf9cf39065353";
    };
    recursive = true;
  };
}
