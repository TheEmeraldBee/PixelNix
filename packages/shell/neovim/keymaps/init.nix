{ lib, ... }:

{
  keymaps = lib.concatLists [
    (import ./general.nix)
    (import ./plugins.nix)
    (import ./movements.nix)
    (import ./zellij.nix)
  ];
}
