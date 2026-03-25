{ config, pkgs, ... }:
{
  boot.plymouth = {
    enable = true;
    theme = "dna";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "dna" ];
      })
    ];
  };
}
