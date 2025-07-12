{pkgs, ...}: {
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.departure-mono
    fira-sans
  ];
}
