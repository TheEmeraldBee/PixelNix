{
  # inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      zig
      zls
    ]
    ++ [
      # inputs.zig.packages.${system}.master
    ];
}
