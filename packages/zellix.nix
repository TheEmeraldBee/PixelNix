{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "a9821797b2f64a31410918083ad68c4825f90ac7";
    };
    recursive = true;
  };
}
