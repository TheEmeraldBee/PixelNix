{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "1720bfc35e51561edfa0a8f2278db23bc93fc4ff";
    };
    recursive = true;
  };
}
