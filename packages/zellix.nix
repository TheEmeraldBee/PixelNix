{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "f385fd03fc2c9c964255bf5186af61b44b2464c3";
    };
    recursive = true;
  };
}
