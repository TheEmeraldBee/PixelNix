{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "7d5a97af828ef31b00ab74a1bf88e56a06c10b79";
    };
    recursive = true;
  };
}
