{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "79f8355abce6c37e37ceb9a1ce27f1b3697dd30a";
    };
    recursive = true;
  };
}
