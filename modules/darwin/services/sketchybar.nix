{pkgs, ...}: {
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
  };
}
