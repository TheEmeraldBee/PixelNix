{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "c273feba923f747702d0d9da126ce7d8343afd39";
    };
    recursive = true;
  };
}
