{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    _1password-gui
    _1password-cli
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = ["brightonlcox"];
  };

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        zen
      '';
      mode = "0755";
    };
  };
}
