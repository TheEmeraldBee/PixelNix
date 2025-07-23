[
  {
    mode = "n";
    key = ";m";
    action = ''<cmd>!zellij run -c -f -x 10\% -y 10\% --width 80\% --height 80\% -- nu ~/.config/nvim/scripts/makefile.nu<cr>'';
    options.desc = "Run makefile script";
  }
  {
    mode = "n";
    key = ";s";
    action = ''<cmd>!zellij run -c -f -x 10\% -y 10\% --width 80\% --height 80\% -- nu<cr>'';
    options.desc = "Open Floating Terminal";
  }

]
