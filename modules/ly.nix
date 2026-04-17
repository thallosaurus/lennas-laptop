{ config, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings = {
    animation = "colormix";
  };
}
