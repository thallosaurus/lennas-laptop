{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        swayfx
        swaybg
    ];

    programs.sway.enable = true;
    programs.sway.package = pkgs.swayfx;
    programs.xfconf.enable = true;
}