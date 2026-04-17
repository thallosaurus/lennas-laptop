{ config, pkgs, ... }:
{
    services.gvfs.enable = true;
    services.udisks2.enable = true;
    services.samba.enable = true;
    services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
        publish = {
            enable = true;
            userServices = true;
            addresses = true;
        };
    };
}