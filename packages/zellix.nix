{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "2b4ffcdb249a503db1ade717f540487421743513";
    };
    recursive = true;
  };
}
