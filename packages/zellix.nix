{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "eeac61b00d7cc5bc5b0b1c5d914a1740e5d80ee1";
    };
    recursive = true;
  };
}
