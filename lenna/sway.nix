{ config, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [
        { command = "mako";}
        { command = "nm-applet";}
        { command = "waybar";}
      ];
      input = {
        "*" = {
	  xkb_layout = "de";
        };
      };
    };
  };

}
