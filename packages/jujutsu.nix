{...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        editor = "hx";
        pager = "bat";
        default-command = "status";
      };
      user = {
        email = "brightonlcox@gmail.com";
        name = "Brighton Cox";
      };
    };
  };
}
