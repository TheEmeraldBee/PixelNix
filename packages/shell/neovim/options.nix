{ config, pkgs, ... }:

{
  opts = {
    updatetime = 100;
    number = true;
    relativenumber = true;

    wrap = false;

    termguicolors = true;

    autoindent = true;
    cursorline = true;
    list = true;

    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];
    expandtab = true;
    shiftwidth = 2;
    smarttab = true;

    signcolumn = "yes";
    mouse = "a";
    clipboard = {
      providers.wl-copy.enable = true; # Use wl-copy for wayland and xsel for Xorg
      register = "unnamedplus";
    };

    whichwrap = "<,>,[,],h,l";
    virtualedit = "onemore";
  };
}
