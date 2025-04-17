{...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      git = {
        subprocess = true;
      };
      revsets = {
        log = "present(@) | ancestors(immutable_heads().., 20) | present(trunk())";
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
