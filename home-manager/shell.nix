{pkgs, ...}: {
  # programs.zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   autosuggestion.enable = true;
  #   syntaxHighlighting.enable = true;

  #   shellAliases = {
  #     # File Listing
  #     ls = "eza -l --icons";
  #     ll = "eza -Alg --icons";
  #     lf = "eza -lgTL2 --icons";
  #     lg = "eza -lgTL4 --git-ignore --icons";

  #     # Zoxide
  #     cd = "z";

  #     # Zellij
  #     e = "zellij action new-tab --layout ~/.config/zellij/layouts/ide.kdl";

  #     # Rust
  #     cup = "cargo +nightly -Zunstable-options update --breaking";
  #     bc = "bacon clippy";

  #     # Dispatching Windows
  #     open = "hyprctl dispatch exec";
  #     float = "hyprctl dispatch exec \"[float;]\"";
  #     perf = "export __NV_PRIME_RENDER_OFFLOAD=1 &&\
  #               export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0 &&\
  #               export __GLX_VENDOR_LIBRARY_NAME=nvidia &&\
  #               export __VK_LAYER_NV_optimus=NVIDIA_only && hyprctl dispatch exec";

  #     # Nix Shell
  #     nix-shell = "nix-shell --run zsh";

  #     # Feh
  #     img = "hyprctl dispatch -- exec \"[float; size 1920 1080;]\" feh -.";

  #     # OS Stuff
  #     ne = "~/dotfiles/scripts/edit.sh";
  #   };

  #   plugins = [
  #     {
  #       name = "zsh-nix-shell";
  #       file = "nix-shell.plugin.zsh";
  #       src = pkgs.fetchFromGitHub {
  #         owner = "chisui";
  #         repo = "zsh-nix-shell";
  #         rev = "v0.8.0";
  #         sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
  #       };
  #     }
  #   ];
  # };

  # programs.zsh.oh-my-zsh = {
  #   enable = true;
  #   plugins = [
  #     "git"
  #     "sudo"
  #   ];
  # };

  programs.nushell = {
    enable = true;
    shellAliases = {
      # OS Stuff
    };
  };

  programs.zoxide = {
    enable = true;
    # enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  # programs.fzf = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };
}
