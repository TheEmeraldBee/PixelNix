{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "c7f36f01a7bf4d447ff6a9b011303a1eec1c7be4";
    };
    recursive = true;
  };
}
