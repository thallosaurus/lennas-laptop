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
        { command = "wal -R"; }
      ];

      input = {
        "*" = {
	        xkb_layout = "de";
        };
      };

      bars = [
        {
          command = "swaybar_command waybar";
        }
      ];
    };

    checkConfig = false;
  
    extraConfig = ''
      include ~/.cache/wal/colors-sway
      output * bg ~/repos/lennas-laptop/wallpaper.png fill
      shadows enable
#      corner_radius 11
      blur_radius 7
      blur_passes 2
      default_border pixel
      default_floating_border pixel

      gaps inner 3
      gaps outer 10

      # class                 border  backgr. text    indicator child_border
      client.focused          $color0 #5f676a #999999 #999999   #999999
      client.focused_inactive $color1 #5f676a #999999 #999999   #999999
      client.unfocused        $color2 #222222 #888888 #292d2e   #1f1e1e
      client.urgent           #999999 #5f676a #999999 #999999   #999999
      client.placeholder      #000000 #0c0c0c #ffffff #000000   #0c0c0c

    '';
  };
}
