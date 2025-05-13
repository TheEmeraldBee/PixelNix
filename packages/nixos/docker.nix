{user, ...}: {...}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  users.users.${user}.extraGroups = ["docker"];
}
