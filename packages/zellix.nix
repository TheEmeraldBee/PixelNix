{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "b6cd8275b5af7ab49b09189d2e86a4240c5621d9";
    };
    recursive = true;
  };
}
