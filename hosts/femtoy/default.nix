{ inputs, pkgs, ... }: {
  networking.hostName = "femtoy";
  imports = [
    ../../modules/common.nix
    ../../modules/filemanager.nix
    ../../modules/ly.nix
    ../../modules/plymouth.nix
    ../../modules/sway.nix
    ../../modules/xfce.nix # for testing
    ../../modules/audio.nix
  ];

  # laptop-specific: power management, touchpad, etc
#  services.tlp.enable = true;
#  services.xserver.libinput.enable = true;
}
