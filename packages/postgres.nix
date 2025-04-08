{...}: {
  services.postgresql = {
    enable = true;
    authentication = ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
    enableTCPIP = true;
  };
}
