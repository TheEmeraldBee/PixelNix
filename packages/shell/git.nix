{pkgs, ...}: {
  home.packages = with pkgs; [
    git
  ];
  programs.git = {
    enable = true;
    userName = "brightonlcox";
    userEmail = "brightonlcox@gmail.com";
  };
}
