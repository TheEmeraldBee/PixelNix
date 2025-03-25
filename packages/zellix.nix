{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "d375f836068187ed31b72aefb321c79d699d9d23";
    };
    recursive = true;
  };
}
