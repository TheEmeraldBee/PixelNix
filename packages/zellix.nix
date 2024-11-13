{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "dc1c77696a689d51bd6909c01ec0aa9d890c6189";
    };
    recursive = true;
  };
}
