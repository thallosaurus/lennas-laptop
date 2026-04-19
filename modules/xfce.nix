{ config, pkgs, callPackage, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  programs.dconf.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
