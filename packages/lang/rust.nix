{pkgs, ...}: {
  home.packages = with pkgs; [
    ###############
    # Subcommands #
    ###############
    cargo-watch

    ########
    # Misc #
    ########
    # SQL
    sqlx-cli

    # Command Watcher
    bacon

    ############
    # Language #
    ############
    rustup
  ];
}
