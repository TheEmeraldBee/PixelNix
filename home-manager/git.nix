{...}: {
  programs.git = {
    enable = true;
    userName = "brightonlcox";
    userEmail = "brightonlcox@gmail.com";
    extraConfig = {
      gpg."ssh".program = "/opt/1Password/op-ssh-sign";
    };
  };

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
