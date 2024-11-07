{
  config,
  pkgs,
  ...
}: {
  services.jankyborders = {
    enable = true;

    blur_radius = 10.0;

    active_color = "0xee00ff99";
    inactive_color = "0xaa595959";
  };
}
