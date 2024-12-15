{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "52056c261c6bc63c9e5389aa47a7eefba691fef8";
    };
    recursive = true;
  };
}
