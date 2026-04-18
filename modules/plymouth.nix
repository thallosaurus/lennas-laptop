{ inputs, pkgs, ... }:
{
  boot.plymouth = {
    enable = true;
    theme = "momosoft";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "dna" ];
      })
#      inputs.plymouth-momosoft.packages.${pkgs.system}.default
      inputs.momosoft-bootscreen.packages.x86_64-linux.default
    ];
  };
    boot.kernelParams = [
    "quiet"
    "udev.log_level=3"
    "systemd.show_status=auto"
  ];
}
