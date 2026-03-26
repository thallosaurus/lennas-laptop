{ config, lib, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
    };

    xdg.configFile."waybar/config.jsonc".source = ./bars/config.jsonc
}