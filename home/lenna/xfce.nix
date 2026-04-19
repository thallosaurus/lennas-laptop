{ config, pkgs, lib, ... }:
{
  gtk = {
    enable = true;
    colorScheme = "dark";
    iconTheme = {
      name = "Adwaita";
    };
    theme = {
      name = "Adwaita-dark";
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}