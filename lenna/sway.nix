{ config, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";

      startup = [
        { command = "mako"; }
        { command = "nm-applet"; }
        { command = "waybar"; }
        { command = "wal -R"; }
      ];

      input = {
        "*" = {
	  xkb_layout = "de";
        };
      };
    };

    checkConfig = false;
  
    extraConfig = ''
      output * bg ~/repos/lennas-laptop/wallpaper.png fill
      shadows enable
#      corner_radius 11
      blur_radius 7
      blur_passes 2
      default_border pixel
      default_floating_border pixel
    '';
  };
}
