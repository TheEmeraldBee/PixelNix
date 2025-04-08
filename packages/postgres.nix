{...}: {
  services.postgresql = {
    enable = true;
    ensureDatabases = ["pluto"];
    authentication = ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
    enableTCPIP = true;
  };
}
