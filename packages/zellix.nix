{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "6329aaf021b6541f580050fee345acdd09e7cb45";
    };
    recursive = true;
  };
}
