{
  # inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      zig
      zls

      go
      gopls
    ]
    ++ [
      # inputs.zig.packages.${system}.master
    ];
}
