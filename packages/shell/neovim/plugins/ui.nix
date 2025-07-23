{ config, pkgs, ... }:

{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      transparent_background = true;
    };
  };
}
