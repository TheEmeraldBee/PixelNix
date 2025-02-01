{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "90cd7414026b48125b68bc844346c935d787aabf";
    };
    recursive = true;
  };
}
