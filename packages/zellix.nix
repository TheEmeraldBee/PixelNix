{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "431eabda82d64e54a32fbde804cb79c847e6e702";
    };
    recursive = true;
  };
}
