{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      zls
    ]
    ++ [
      inputs.zig.packages.${system}.master
    ];
}
