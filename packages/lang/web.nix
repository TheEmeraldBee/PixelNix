{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs_24
    typescript-language-server
  ];
}
