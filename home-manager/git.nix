{ ... }: {
  programs.git = {
    enable = true;
    userName = "brightonlcox";
    userEmail = "brightonlcox@gmail.com";
    extraConfig = {
      gpg."ssh".program = "/opt/1Password/op-ssh-sign";
    };
  };
}
