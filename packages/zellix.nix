{...}: {
  xdg.configFile."zellix" = {
    source = builtins.fetchGit {
      url = "https://github.com/TheEmeraldBee/zellix";
      rev = "0c0cf3d00e77651d807248f388dbde4862680085";
    };
    recursive = true;
  };
}
