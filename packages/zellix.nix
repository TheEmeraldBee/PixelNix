{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "c3eb16c23f5b704167105eccb032d67e6cb8cc05";
    };
    recursive = true;
  };
}
