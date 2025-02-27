{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "05d07c3bb65bcb3279ffae71125f899f18838ceb";
    };
    recursive = true;
  };
}
