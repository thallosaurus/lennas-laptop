{ config, lib, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";

#      keybindings = let
#        inherit (config.home-manager.users.lenna.wayland.windowManager.sway.config) modifier menu;
#      in lib.mkOptionDefault {
#        "${modifier}+d" = "exec wofi --show drun";
#      };
#
      keybindings = lib.mkOptionDefault {
        "Mod4+d" = "exec wofi --show drun --gtk-dark";
      };
      startup = [
        { command = "mako"; }
        { command = "nm-applet"; }
#        { command = "wal -R"; }
        { command = "caja --force-desktop --no-default-window";  }
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

      # window rules
      for_window [title="."] floating enable
      for_window [app_id="kitty"] floating disable
      for_window [app_id="firefox"] floating disable
      for_window [app_id="wiremix"] floating enable, resize set width 80ppt, resize set height 40ppt
      for_window [app_id="wallpaper"] floating enable, resize set width 80ppt, resize set height 50ppt
      for_window [class="Code"] floating disable; opacity 0.9
      for_window [shell="xwayland"] title_format "%title [XWayland]"
      for_window [title="(?:Open|Save) (?:File|Folder|As|file\(s\))"] floating enable; move position center; resize set height 50ppt; resize set width: 50ppt

    '';
  };
}
