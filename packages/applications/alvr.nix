{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alvr
  ];
}
