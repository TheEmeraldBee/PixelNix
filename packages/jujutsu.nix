{...}: {
  programs.jujutsu = {
    # enable = true;
    settings = {
      git = {
        subprocess = true;
      };
      ui = {
        editor = "hx";
        pager = "bat --decorations never";
        default-command = "status";
      };
      user = {
        email = "brightonlcox@gmail.com";
        name = "Brighton Cox";
      };
    };
  };
}
