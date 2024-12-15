{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "0ff5cb1198de3cb76f2f5c8d34d08d76eb829da3";
    };
    recursive = true;
  };
}
